package com.niit.model;
	import javax.persistence.Entity;

import javax.persistence.Id;
	import javax.persistence.Table;
	import org.springframework.stereotype.Component;

			@Entity
			@Table
			@Component
			public class Supplier{
				
			    private String supplierid ;
				private String suppliername;
				@Id
				public String getSupplierid() {
					return supplierid;
				}
				public void setSupplierid(String supplierid) {
					this.supplierid = supplierid;
				}
				public String getSuppliername() {
					return suppliername;
				}
				public void setSuppliername(String suppliername) {
					this.suppliername = suppliername;
				}
				
				
				
				
}
