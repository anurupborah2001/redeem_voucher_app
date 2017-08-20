package com.jwt.redeem.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name ="jwt_user_deal")
public class UserDeals {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id",columnDefinition = "bigint(20)")
	private int id;
	
//	@Id
	@Column(name="user_id",columnDefinition = "int")
	private int user_id;
	
	@Column(name="deal_id",columnDefinition = "int")
	private int deal_id;

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getDeal_id() {
		return deal_id;
	}

	public void setDeal_id(int deal_id) {
		this.deal_id = deal_id;
	}
	

}
