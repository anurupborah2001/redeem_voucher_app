package com.jwt.redeem.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.JDBCException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.redeem.entities.Role;
import com.jwt.redeem.entities.User;
import com.jwt.redeem.repositories.RoleRepository;
import com.jwt.redeem.repositories.UserRepository;

@Repository("userDaoRepo")
@Transactional
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
    private RoleRepository roleRepository;
	
    @Autowired
    public BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory)
	{
	    this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	public User findByUserName(String username) {
		List<User> users = new ArrayList<User>();

			users = sessionFactory.getCurrentSession()
				.createQuery("from User where username=?")
				.setParameter(0, username)
				.list();
	
			if (users.size() > 0) {
				return users.get(0);
			} else {
				return null;
			}
		}
	
	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		if(username != null){
			return this.userRepository.findByUsername(username);
		}
		return null;
	}
	
	@Override
	public User getLoginUser(String userName) throws HibernateException {
		// TODO Auto-generated method stub
		User userInfo = new User();
		short enabled = 1;
		List<?> list = this.hibernateTemplate.find("FROM users WHERE username=? and enabled=?",
				userName, enabled);
		if(!list.isEmpty()) {
			userInfo = (User)list.get(0);
		}
		return userInfo;
	}
	
	
	public boolean saveUserData(User user){
		boolean returUserSave = false;
			try{
			user.setEmail(user.getEmail());
			user.setFirst_name(user.getFirst_name());
			user.setLast_name(user.getLast_name());
			user.setUsername(user.getUsername());
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
	        user.setEnabled(1);
	        
	        Role userRole = roleRepository.findByRole("ROLE_ADMIN");
	        
	        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
	        userRepository.save(user);
	        returUserSave = true;
		} catch(JDBCException e) {
		    //Error during hibernate query
			System.out.println(e.getMessage());
		}
		return returUserSave;
	}

	@Override
	public User findUserByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
