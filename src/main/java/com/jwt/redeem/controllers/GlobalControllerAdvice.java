package com.jwt.redeem.controllers;

import java.sql.SQLException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;


/* All attributes that are common to the all the controllers are defined here */
@ControllerAdvice(annotations=Controller.class)
public class GlobalControllerAdvice {
	private static final Logger logger = (Logger) LoggerFactory.getLogger(GlobalControllerAdvice.class);
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleError(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/local_error");
		return mv;
	}
	
	@ExceptionHandler(SQLException.class)
	public ModelAndView handleSQLException(HttpServletRequest request, Exception ex){
		//logger.info("SQLException Occured:: URL="+request.getRequestURL());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/database_error");
		return mv;
	}
	
	@ResponseStatus(HttpStatus.CONFLICT)  // 409
    @ExceptionHandler(DataIntegrityViolationException.class)
    public void handleDataBaseConflict() {
        // Nothing to do
    }
	
}
