package com.niit.dao;
import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.niit.model.Category;
@Repository("categoryDAO")
public class Categorydaoimpl implements Categorydao {
		
		
	@Autowired
    private SessionFactory sessionFactory;
     public Categorydaoimpl(SessionFactory session) {
		sessionFactory=session;
	}
		
		 @Transactional
		    public void deleteCategory(String Categoryid) {
		        Category c = (Category) sessionFactory.getCurrentSession().load(Category.class, Categoryid);
		        if (null != c) {
		            this.sessionFactory.getCurrentSession().delete(c);
		        }
		    }
		    @Transactional
		    public Category getCategory(String Categoryid) {
		        return (Category) sessionFactory.getCurrentSession().get(Category.class,Categoryid);
		    }
		 @Transactional
		    public Category updateCategory(Category c) {
			 Category c1=getCategory(c.getCategoryid());
		        sessionFactory.getCurrentSession().update(c1);
		        return c1;
		    }
		 @Transactional
		public void addCategory(Category c) {
			 System.out.println(c.getCategoryid());
			 System.out.println(c.getCategoryname());
			sessionFactory.getCurrentSession().saveOrUpdate(c);
		}
		 @Transactional
		public List<Category> getAllCategories() {
			 return sessionFactory.getCurrentSession().createQuery("from Category").list();
		 }
		
		 @Override
		 @Transactional
			public Category getCategoryByCategoryid(String categoryid) {
				Session session = this.sessionFactory.getCurrentSession();		
				Category c= (Category) session.load(Category.class, new Integer(categoryid));
		return c;
		
		 }

		@Override
			@Transactional
			public Category getByName(String categoryname)
			{
				String hql = " from Category where categoryname = " + "'" + categoryname + "'";
				
				@SuppressWarnings("rawtypes")
				Query query = sessionFactory.getCurrentSession().createQuery(hql);
				
				@SuppressWarnings("unchecked")
				List<Category> listCategory = query.list();
				
				if(listCategory!=null || !listCategory.isEmpty())
				{
					return listCategory.get(0);
				}
				return null;
			}
		
}	 
		
	


