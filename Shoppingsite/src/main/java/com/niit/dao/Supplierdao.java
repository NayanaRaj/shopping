package com.niit.dao;
import java.util.List;

import org.springframework.stereotype.Repository;


import com.niit.model.Supplier;

@Repository("supplierDAO")
public interface Supplierdao {
		
		 public void addSupplier(Supplier s);
		 
		    public List<Supplier> getAllSuppliers();
		 
		    public void deleteSupplier(String Supplierid);
		 
		    public Supplier updateSupplier(Supplier s);
		 
		    public Supplier getSupplier(String Supplierid);

		public	Supplier getSupplierBySupplierid(String supplierid);

		public Supplier getByName(String name);


		}

