package com.jwt.redeem.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jwt.redeem.constants.Constant;
import com.jwt.redeem.entities.Deal;
import com.jwt.redeem.entities.User;
import com.jwt.redeem.exception.ControllerException;
import com.jwt.redeem.service.DealService;
import com.jwt.redeem.service.UserService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private DealService dealService;

	@RequestMapping(method=RequestMethod.GET)
	public String goHome(){
		return "login";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String goHomePost(){
		return "login";
	}
	
	@RequestMapping("/services")
	public String goServices(){
		return "services";
	}
	
	@RequestMapping(value=Constant.LOGIN_GET, method=RequestMethod.GET)
	public String goLogin(){
		return "login";
	}
	
	
	
	@RequestMapping("/schedule")
	public String goSchedule(){
		return "schedule";
	}
	
	
	@RequestMapping(value = Constant.REDEEM_GET, method=RequestMethod.GET)
	public String getRedeemVoucher(Principal p,HttpServletRequest request,Model model){
		List<Deal> listDeals = new ArrayList<Deal>();
		if(p!=null){
			Deal newRandomDeal = dealService.getOneRandomDealByUId(p);
			if(newRandomDeal!=null){
				listDeals = Arrays.asList(newRandomDeal);
			}
		}else{
			listDeals = dealService.getAllDeals();
		}
		
		model.addAttribute("listDeals", listDeals);
		return "redeem";
	}
	
	
	@RequestMapping(value=Constant.REGISTRATION_URL, method = RequestMethod.GET)
	public String registration(Model model){
		model.addAttribute("label","Registration");
		model.addAttribute("formaction","/registration");
		model.addAttribute("user",  new User());
		//logger.info("user",new User());
		return "registration";
	}
	
	@RequestMapping(value = Constant.REGISTRATION_URL, method = RequestMethod.POST)
	public ModelAndView createNewUser(
			@Valid User user,
			BindingResult bindingResult,
			final RedirectAttributes redirectAttributes,
			Model model) {
		ModelAndView modelAndView = new ModelAndView();
		User userExists = userService.findUserByEmail(user.getEmail());
		if (userExists != null) {
			bindingResult
					.rejectValue("email", "error.user",
							"There is already a user registered with the email provided");
		}
		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("registration");
		} else {
			userService.saveUser(user);
			redirectAttributes.addFlashAttribute("successMessage", "User has been registered successfully");
			modelAndView.addObject("user", new User());
			modelAndView.addObject("successMessage", "User has been registered successfully.Please Login");
			modelAndView.setViewName("registration");
		}
		return modelAndView;
	}
	
	@RequestMapping("*")
	@ResponseBody
	public String fallbackMethod(){
		//throw new NullPointerException();
		return "fallback method";
	}
	
	/* Ajax Calls*/
	@RequestMapping(value=Constant.REDEEM_DETAILS,method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	//@ExceptionHandler(ControllerException.class)
	public Object getDetailDeal(Model model,@PathVariable("redeemid") String redeemid) throws Exception{
		if(redeemid=="") throw new ControllerException(Integer.parseInt(redeemid));
		System.out.println(redeemid);
		return Arrays.asList(dealService.getDealById(Integer.parseInt(redeemid)));
	}
	
	@RequestMapping(value=Constant.REDEEM_SAVE,method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	//@RequestParam Map<String,String> allRequestParams
	public Object saveRedeemForUser(@RequestBody Map<String,String> data,Principal p) {
		return dealService.saveUserDeals(data,p);
	}
	
}
