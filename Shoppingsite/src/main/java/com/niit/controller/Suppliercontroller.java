package com.niit.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.Supplierdao;
import com.niit.model.Supplier;


@Controller
public class Suppliercontroller {

	
	@Autowired
	private Supplierdao supplierDAO;
	@Autowired
	private Supplier supplier;
	
	@RequestMapping("/Supplier")
	public String prform(Model model) {
		//model.addAttribute("productList", this.productDAO.getAllProducts());
		return "Supplier";
	}
	
	@RequestMapping("/getSuppliers")
	public String Listsupplier(Model model) {
		model.addAttribute("supplierList", this.supplierDAO.getAllSuppliers());
		return "Supplier";
	}
	
		@ModelAttribute("supplier")
		public Supplier getsupplierForm() {
		    return new Supplier();
		}
		
		@RequestMapping(value = "/addsupplier", method = RequestMethod.POST)
	    public ModelAndView saveSupplier(@ModelAttribute("supplier") Supplier supplier) {
//	        if(user.getUsername()=="")
//	        {
			System.out.println(supplier.getSupplierid());
			System.out.println(supplier.getSuppliername());
			supplierDAO.addSupplier(supplier);
//	        } else {
//	           userDao.updateUser(user);
//	        }
	        return new ModelAndView("redirect:/getSuppliers");
	    }
		  @RequestMapping("/updatesup-{supplierid}")
	        public String modifyCategory(@PathVariable("supplierid") String supplierid,Model m){
	    		
	            this.supplier=this.supplierDAO.getSupplier(supplierid);
	            m.addAttribute("supplier", supplierDAO.getSupplier(supplierid));
	            m.addAttribute("listSupplier", this.supplierDAO.getAllSuppliers());
				
				
	            System.out.println(supplierDAO.getSupplier(supplierid).getSupplierid());
	            return "Supplier";
	        }
	    	
	    	
	    	@RequestMapping("/deletesup-{supplierid}")
	        public String deleteCategory(@PathVariable("supplierid") String supplierid){
	    		
	            this.supplierDAO.deleteSupplier(supplierid);
	            return "redirect:/getSuppliers";
	        }
	    	
			
		}
	
