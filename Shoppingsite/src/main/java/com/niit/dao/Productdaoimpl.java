package com.niit.dao;
import java.util.List;



import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.niit.model.Product;
@Repository("productDAO")

public class Productdaoimpl implements Productdao {
		
		
		    @Autowired
		    private SessionFactory sessionFactory;
		     public Productdaoimpl(SessionFactory session) {
				sessionFactory=session;
			}
		 @Transactional
		    public void addProduct(Product p) {
		        sessionFactory.getCurrentSession().saveOrUpdate(p);
		 
		    }
		 @Transactional
		    @SuppressWarnings("unchecked")
		    public List<Product> getAllProducts() {
		 
		        return sessionFactory.getCurrentSession().createQuery("from Product").list();
		    }
		 @Transactional
		    public void deleteProduct(String id) {
		        Product p = (Product) sessionFactory.getCurrentSession().load(Product.class, id);
		        if (null != p) {
		            this.sessionFactory.getCurrentSession().delete(p);
		        }
		    }
//		    @Transactional
//		    public Product getProduct(int id) {
//		        return (Product) sessionFactory.getCurrentSession().get(Product.class, id);
//		    }
		 @Transactional
		    public Product updateProduct(Product p) {
			 System.out.println("product id is "+p.getId());
			
			 System.out.println(p.getName());
			sessionFactory.getCurrentSession().update(p);
		        return p;
		    }
		 @Override
		 @Transactional
			public Product getProductByProductid(String id) {
				Session session = this.sessionFactory.getCurrentSession();		
				Product p= (Product) session.load(Product.class, new Integer(id));
		return p;
		
		 }	


@Transactional
public Product getProduct(String id) {
	String hql = "from Product where id='"+ id+"'" ;
	org.hibernate.Query query= sessionFactory.getCurrentSession().createQuery(hql); 
	@SuppressWarnings("unchecked")
	List<Product> listProduct = query.list();
	
	if (listProduct != null && !listProduct.isEmpty()) {
		return listProduct.get(0);
	}
	return null;}
@Override
public Product getByName(String name) {
	// TODO Auto-generated method stub
	
		String hql = "from Product where name=" + "'"+ name +"'";
		@SuppressWarnings("rawtypes")
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Product> listProduct = (List<Product>) query.list();
		
		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct.get(0);
		}
		
		return null;
	}
}
			
		 
		
	


