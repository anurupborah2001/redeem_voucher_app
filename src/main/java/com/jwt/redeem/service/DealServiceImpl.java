package com.jwt.redeem.service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.redeem.dao.DealDao;
import com.jwt.redeem.entities.Deal;
import com.jwt.redeem.entities.User;
import com.jwt.redeem.repositories.UserRepository;

@Service
public class DealServiceImpl implements DealService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private DealDao dealDao;
	
	private List<Deal> dealList = new ArrayList<>();
	@Override
	@Transactional
	public List<Deal> getDealBasedonUID(Principal p) {
		// TODO Auto-generated method stub
		if(p!=null){
			User getUser = userRepository.findByUsername(p.getName());
			if(getUser != null){
				dealList =  dealDao.getAllDealsByUId(getUser.getUser_id());
			}
		}
		return dealList;
	}


	@Override
	@Transactional
	public List<Deal> getAllDeals() {
		// TODO Auto-generated method stub
		return  dealDao.getAllDeals();
	}


	@Override
	public Deal getDealById(int deal_id) {
		// TODO Auto-generated method stub
		return dealDao.getDealsDetailsBydDealId(deal_id);
	}


	@Override
	public Deal getOneRandomDealByUId(Principal p) {
		// TODO Auto-generated method stub
		if(p!=null){
			User getUser = userRepository.findByUsername(p.getName());
			if(getUser != null){
				return dealDao.getOneRandomDealByUId(getUser.getUser_id());
			}
		}
		return null;
	}


	@Override
	@Transactional
	public boolean saveUserDeals(Map<?, ?> obj,Principal p) {
		// TODO Auto-generated method stub
		if(!obj.isEmpty() && obj.containsKey("deal_id") && p!=null){
			User getUser = userRepository.findByUsername(p.getName());
			if(getUser != null){
				return dealDao.saveUserDeal(getUser.getUser_id(),Integer.parseInt(obj.get("deal_id").toString()));
			}
		}
		return false;
	}
}
