package com.jwt.redeem.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.redeem.dao.UserDao;
import com.jwt.redeem.dao.UserDaoImpl;
import com.jwt.redeem.entities.Role;
import com.jwt.redeem.entities.User;
import com.jwt.redeem.repositories.UserRepository;

@Component("appUserDetailService")
public class AppUserDetailLoginService implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;
	

	@Override
	@Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    	System.out.println(username);
        User user = userRepository.findByUsername(username);
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        for (Role role : user.getRoles()){
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getRole()));
        }
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), grantedAuthorities);
    }
	
	 private List<SimpleGrantedAuthority> getAuthorities(String role) {
	        List<SimpleGrantedAuthority> authList = new ArrayList<>();
	        authList.add(new SimpleGrantedAuthority("ROLE_USER"));
	        if (role != null && role.trim().length() > 0) {
	            if (role.equals("ROLE_ADMIN")) {
	                authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
	            }
	        }
	 
	        return authList;
	 }
}
