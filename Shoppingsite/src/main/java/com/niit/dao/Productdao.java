package com.niit.dao;
import java.util.List;

import org.springframework.stereotype.Repository;


import com.niit.model.Product;
@Repository("productDAO")
public interface Productdao {
		
		 public void addProduct(Product p);
		 
		    public List<Product> getAllProducts();
		 
		    public void deleteProduct(String id);
		 
		    public Product updateProduct(Product p);
		 
		    public Product getProduct(String id);

			public Product getProductByProductid(String id);

			public Product getByName(String name);
		}

