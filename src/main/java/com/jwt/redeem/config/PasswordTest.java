package com.jwt.redeem.config;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordTest { 
	
	public static void main(String[] args) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println(encoder.encode("pass123"));
	}
}
