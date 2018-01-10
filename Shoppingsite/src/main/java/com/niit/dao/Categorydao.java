package com.niit.dao;
import java.util.List;

import org.springframework.stereotype.Repository;


import com.niit.model.Category;
@Repository("categoryDAO")
public interface Categorydao {
		
		 public void addCategory(Category c);
		 
		    public List<Category> getAllCategories();
		 
		    public void deleteCategory(String Categoryid);
		 
		    public Category updateCategory(Category c);
		 
		    public Category getCategory(String Categoryid);
		    public Category getCategoryByCategoryid(String Categoryid);
		    public Category getByName(String name);
			


			
		}

