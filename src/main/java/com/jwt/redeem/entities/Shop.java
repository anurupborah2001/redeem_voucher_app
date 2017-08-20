package com.jwt.redeem.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "jwt_shop_list")
public class Shop {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "shop_id",columnDefinition = "bigint(20)")
	private int shop_id;
	
	@Column(name="shop_name",length=150)
	private String shop_name;
	
	@Column(name="shop_status",columnDefinition = "TINYINT")
	private int shop_status;
	
	@Column(name="shop_inserted_at")
	private LocalDateTime shop_inserted_at;
	
	@Column(name="shop_updated_at")
	private LocalDateTime shop_updated_at;

	public Shop() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getShop_id() {
		return shop_id;
	}

	public void setShop_id(int shop_id) {
		this.shop_id = shop_id;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public int getShop_status() {
		return shop_status;
	}

	public void setShop_status(int shop_status) {
		this.shop_status = shop_status;
	}

	public LocalDateTime getShop_inserted_at() {
		return shop_inserted_at;
	}

	public void setShop_inserted_at(LocalDateTime shop_inserted_at) {
		this.shop_inserted_at = shop_inserted_at;
	}

	public LocalDateTime getShop_updated_at() {
		return shop_updated_at;
	}

	public void setShop_updated_at(LocalDateTime shop_updated_at) {
		this.shop_updated_at = shop_updated_at;
	}

	@Override
	public String toString() {
		return "Shop [shop_id=" + shop_id + ", shop_name=" + shop_name + ", shop_status=" + shop_status
				+ ", shop_inserted_at=" + shop_inserted_at + ", shop_updated_at=" + shop_updated_at + "]";
	}
	
	
}
