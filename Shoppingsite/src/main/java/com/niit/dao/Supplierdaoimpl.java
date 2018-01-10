package com.niit.dao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Product;
import com.niit.model.Supplier;
@Repository("supplierDAO")
public class Supplierdaoimpl implements Supplierdao {
		
		
	@Autowired
    private SessionFactory sessionFactory;
     public Supplierdaoimpl(SessionFactory session) {
		sessionFactory=session;
	}
		
		 @Transactional
		    public void deleteSupplier(String Supplierid) {
		        Supplier s = (Supplier) sessionFactory.getCurrentSession().load(Supplier.class, Supplierid);
		        if (null != s) {
		            this.sessionFactory.getCurrentSession().delete(s);
		        }
		    }
		 
		 @Transactional
		    public Supplier updateSupplier(Supplier s) {
			 Supplier s1=getSupplier(s.getSupplierid());
		        sessionFactory.getCurrentSession().update(s1);
		        return s1;
		    }
		 @Transactional
		public void addSupplier(Supplier s) {
			sessionFactory.getCurrentSession().saveOrUpdate(s);
		}
		 @Transactional
		public List<Supplier> getAllSuppliers() {
			 return sessionFactory.getCurrentSession().createQuery("from Supplier").list();
		}
		 @Override
		 @Transactional
			public Supplier getSupplierBySupplierid(String supplierid) {
				Session session = this.sessionFactory.getCurrentSession();		
				Supplier s= (Supplier) session.load(Supplier.class, new Integer(supplierid));
		return s;
		
		 }	
		 @Transactional
		 public Supplier getSupplier(String supplierid) {
		 	String hql = "from Supplier where supplierid='"+ supplierid+"'" ;
		 	org.hibernate.Query query= sessionFactory.getCurrentSession().createQuery(hql); 
		 	@SuppressWarnings("unchecked")
		 	List<Supplier> listSupplier = query.list();
		 	
		 	if (listSupplier != null && !listSupplier.isEmpty()) {
		 		return listSupplier.get(0);
		 	}
		 	return null;
		 	}

		@Override
		
			@Transactional
			public Supplier getByName(String suppliername)
			{
				String hql = " from Supplier where suppliername = " + "'" + suppliername + "'";
				
				@SuppressWarnings("rawtypes")
				Query query = sessionFactory.getCurrentSession().createQuery(hql);
				
				@SuppressWarnings("unchecked")
				List<Supplier> listSupplier = query.list();
				
				if(listSupplier!=null || !listSupplier.isEmpty())
				{
					return listSupplier.get(0);
				}
				return null;
			}

		

		 
		 			
		 		 
		
		
		
		
			
		 
		}
		
	


