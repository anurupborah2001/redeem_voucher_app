package com.jwt.redeem.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.aspectj.lang.annotation.After;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.jwt.redeem.entities.Deal;
import com.jwt.redeem.entities.UserDeals;
import com.jwt.redeem.exception.DaoException;


@Repository("dealDao")
public class DealDaoImpl implements DealDao{

	@Autowired
    private SessionFactory sessionFactory;
	
	public DealDaoImpl(){
		super();
	}
	
	
	protected Session getSession(){
        return this.sessionFactory.openSession();
	}
	
	
	public static Object getRandomItem(List<?> obj) {
	    try {
	        return obj.get((new Random()).nextInt(obj.size()));
	    }
	    catch (Throwable e){
	        return null;
	    }
	}
	
	
	@Override
	public Deal getOneRandomDealByUId(int user_id) {
		try{
			getSession().beginTransaction();
			String hql = "from Deal d Where d.jwt_deal_id not in (Select ud.deal_id from UserDeals ud Where ud.user_id = ?)";
			@SuppressWarnings("unchecked")
			List<Deal> listDeals = (List<Deal>)getSession().createQuery(hql).setParameter(0, user_id).list();
//			getSession().getTransaction().commit();
			return (Deal)getRandomItem(listDeals);
		}catch (Exception e) {
			new DaoException(e, getSession().getSessionFactory());
			return null;
		}
	}
	
	@Override
	public List<Deal> getAllDealsByUId(int user_id) {
		// TODO Auto-generated method stub
		try{
			getSession().beginTransaction();
			String hql = "from Deal d Where d.jwt_deal_id not in (Select ud.deal_id from UserDeals ud Where ud.user_id = ?)";
			@SuppressWarnings("unchecked")
			List<Deal> listDeals = (List<Deal>)getSession().createQuery(hql).setParameter(0, user_id).list();
//			getSession().getTransaction().commit();
			return listDeals;
		}catch (Exception e) {
			new DaoException(e, getSession().getSessionFactory());
			return null;
		}
	}

	@Override
	public Deal getDealsDetailsBydDealId(int deal_id) {
		// TODO Auto-generated method stub
		try{
			getSession().beginTransaction();
			Deal d =  (Deal) getSession().get(
					Deal.class, deal_id);
//			getSession().getTransaction().commit();
			return d;
		}catch (Exception e) {
			new DaoException(e, getSession().getSessionFactory());
			return null;
		}
	}


	@Override
	public List<Deal> getAllDeals() {
		// TODO Auto-generated method stub
		try{
			int enabled = 1;
			getSession().beginTransaction();
			List<Deal> listDeals = (List<Deal>) getSession().createQuery("from Deal d left join d.shop as shop  Where d.is_active = ?").setParameter(0, enabled).list();
//			getSession().getTransaction().commit();
			return listDeals;
		}catch (Exception e) {
			new DaoException(e, getSession().getSessionFactory());
			return null;
		}
	}


	@Override
	public boolean saveUserDeal(int user_id, int deal_id) {
		boolean returnFlag = false;
		Session sess = sessionFactory.openSession();
		 Transaction tx = null;
		 try {
		     tx = sess.beginTransaction();
		     	SQLQuery query = sess.createSQLQuery("INSERT INTO  jwt_user_deal(user_id, deal_id) values (?,?)");
				query.setParameter(0, user_id);
				query.setParameter(1, deal_id);
				int result  = query.executeUpdate();
				tx.commit();
				returnFlag = true;
		 }
		 catch (Exception e) {
		     if (tx!=null) tx.rollback();
		     throw e;
		 }
		 finally {
		     sess.close();
		 }
		 return returnFlag;
	}
	
//	 @After(value = "")
//	 public void breakDown ()
//    {
//        sessionFactory.close();
//    }
}
