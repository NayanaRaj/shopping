package com.niit.dao;
 
import java.util.List;
 
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.User;
 
@Repository("userDao")
public class Userdaoimpl implements Userdao {
 
    @Autowired
    private SessionFactory sessionFactory;
     public Userdaoimpl(SessionFactory session) {
		sessionFactory=session;
	}
 @Transactional
    public void addUser(User u) {
        sessionFactory.getCurrentSession().saveOrUpdate(u);
 
    }
 @Transactional
    @SuppressWarnings("unchecked")
    public List<User> getAllUsers() {
 
        return sessionFactory.getCurrentSession().createQuery("from User").list();
    }
 @Transactional
    public void deleteUser(String Username) {
        User u = (User) sessionFactory.getCurrentSession().load(User.class, Username);
        if (null != u) {
            this.sessionFactory.getCurrentSession().delete(u);
        }
    }
    @Transactional
    public User getUser(String Username) {
        return (User) sessionFactory.getCurrentSession().get(User.class, Username);
    }
 @Transactional
    public User updateUser(User u) {
	 User user=getUser(u.getUsername());
        sessionFactory.getCurrentSession().update(user);
        return u;
    }

	
 
}