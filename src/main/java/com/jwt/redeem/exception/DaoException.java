package com.jwt.redeem.exception;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class DaoException extends BaseException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3912706628649157963L;
	
	@Autowired
    private SessionFactory sessionFactory;
	
	public DaoException(Exception e,SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
		handleException(e);
	}
	
	public void handleException(Exception e){
		if(e instanceof HibernateException){
			this.sessionFactory.close();
		}else{
			this.sessionFactory.close();
		}
	}

}
