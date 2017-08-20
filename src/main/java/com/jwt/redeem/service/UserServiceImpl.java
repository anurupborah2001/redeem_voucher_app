package com.jwt.redeem.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.JDBCException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.redeem.controllers.HomeController;
import com.jwt.redeem.dao.UserDao;
import com.jwt.redeem.dao.UserDaoImpl;
import com.jwt.redeem.entities.Role;
import com.jwt.redeem.entities.User;
import com.jwt.redeem.repositories.RoleRepository;
import com.jwt.redeem.repositories.UserRepository;

@Service("userService")
public class UserServiceImpl implements UserService,UserDetailsService{

	//private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserDao userDaoRepo;


	
	@Override
	public User findUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	@Override
	public boolean saveUser(User user) {
		boolean returUserSave = false;
		if(user != null){
			returUserSave = userDaoRepo.saveUserData(user);
		  }
		return returUserSave;
	}
	
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
