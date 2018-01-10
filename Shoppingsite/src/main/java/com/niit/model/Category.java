package com.niit.model;
	import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
	import org.springframework.stereotype.Component;

			@Entity
			@Table
			@Component
			public class Category {
				
//				@GeneratedValue(strategy=GenerationType.AUTO)
			    private String categoryid ;
				private String categoryname;
				private Set<Product> products;
				
				
				@Id
				public String getCategoryid() {
					return categoryid;
				}
				public void setCategoryid(String categoryid) {
					this.categoryid = categoryid;
				}
				
				@OneToMany(mappedBy="category" , fetch = FetchType.EAGER)	
				public Set<Product> getProducts() {
					return products;
				}
				public void setProducts(Set<Product> products) {
					this.products = products;
				}
				
				public String getCategoryname() {
					return categoryname;
				}
				public void setCategoryname(String categoryname) {
					this.categoryname = categoryname;
				}
				
				
				

}
