package com.jwt.redeem.dao;

import java.util.List;

import com.jwt.redeem.entities.Deal;
import com.jwt.redeem.entities.User;

public interface DealDao {
	List<Deal> getAllDealsByUId(int user_id);
	Deal getDealsDetailsBydDealId(int deal_id);
	List<Deal> getAllDeals();
	Deal getOneRandomDealByUId(int user_id);
	boolean saveUserDeal(int user_id,int deal_id);
}
