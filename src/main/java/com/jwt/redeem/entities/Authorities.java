package com.jwt.redeem.entities;

import org.springframework.security.core.GrantedAuthority;

public class Authorities implements GrantedAuthority{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8169451549831049598L;
	/**
	 * 
	 */
	
	private String username;
	private String authority;
	
	public String getAuthority() {
		// TODO Auto-generated method stub
		return this.authority;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	

}
