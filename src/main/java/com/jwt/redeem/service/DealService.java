package com.jwt.redeem.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import com.jwt.redeem.entities.Deal;

public interface DealService {
	public List<Deal> getDealBasedonUID(Principal p);
	public List<Deal> getAllDeals();
	public Deal getDealById(int deal_id);
	public Deal getOneRandomDealByUId(Principal p);
	public boolean saveUserDeals(Map<?,?> obj,Principal p);
}
