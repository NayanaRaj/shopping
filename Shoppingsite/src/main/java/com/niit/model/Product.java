package com.niit.model;

import java.io.Serializable;

import javax.persistence.Entity;


import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table
@Component
public class Product implements Serializable{
	@Id
	private String id;
	private String name;
	private String description;
	private int price;
	 private  String categoryid;
	    private String supplierid;
	@Transient
	private MultipartFile pimage;
	@ManyToOne 
    @JoinColumn(name="categoryid" , updatable= false , insertable= false, nullable=false)
    private Category category;
	
	@ManyToOne 
    @JoinColumn(name="supplierid" , updatable= false , insertable= false, nullable=false)
    private Supplier supplier;
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

    public String getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(String categoryid) {
		this.categoryid = categoryid;
	}
	public String getSupplierid() {
		return supplierid;
	}
	public void setSupplierid(String supplierid) {
		this.supplierid = supplierid;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
	
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	
	public MultipartFile getPimage() {
		return pimage;
	}
	public void setPimage(MultipartFile pimage) {
		this.pimage = pimage;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
