package com.niit.controller;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.Categorydao;
import com.niit.dao.Productdao;
import com.niit.dao.Supplierdao;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;
import com.niit.util.Fileutil;


@Controller
public class Productcontroller {

	
	@Autowired
	private Productdao productDAO;
	@Autowired
	private Product product;
	@Autowired
	private Categorydao categoryDAO;
	@Autowired
	private Supplierdao supplierDAO;
	
	
	 private Path path;
	
	@RequestMapping("/product")
	public String prform(Model model) {
		//model.addAttribute("productList", this.productDAO.getAllProducts());
		return "Product";
	}
	
	@RequestMapping("/getProduct")
	public String Listproduct(Model model) {
		model.addAttribute("productList", this.productDAO.getAllProducts());
		model.addAttribute("categoryList",this.categoryDAO.getAllCategories());
		model.addAttribute("supplierList",supplierDAO.getAllSuppliers());
		return "Product";
	}
	
		@ModelAttribute("product")
		public Product getprForm() {
		    return new Product();
		}
		@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	    public ModelAndView saveproduct(@ModelAttribute("product") Product product, HttpServletRequest request) {

			Category category = categoryDAO.getByName(product.getCategory().getCategoryname());
			System.out.println(category.getCategoryname());
			categoryDAO.addCategory(category);
			
			Supplier supplier = supplierDAO.getByName(product.getSupplier().getSuppliername());
			supplierDAO.addSupplier(supplier);
			
			product.setCategory(category);
			product.setSupplier(supplier);
			
			product.setCategoryid(category.getCategoryid());
			product.setSupplierid(supplier.getSupplierid());
			
	            productDAO.addProduct(product);
   

	    		MultipartFile file=product.getPimage();
	    		/**/
	    		String rootDirectory=request.getSession().getServletContext().getRealPath("/");
	    		/*path=Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\"+product.getPro_id()+".jpg");*/
	    		path = Paths.get(rootDirectory + "\\resources\\images\\" + product.getId() + ".jpg");
	    		
	    		if(file!=null && !file.isEmpty()){
	    			try{
	    				file.transferTo(new File(path.toString()));
	    				System.out.println("Image Uploaded to Product.....");
	    			}catch(Exception e)
	    			{
	    				e.printStackTrace();
	    				throw new RuntimeException("image saving failed ",e);
	    			}
	    		}
	    		
	    		System.out.println("path converting to string");
	    		Fileutil.upload(path.toString(), file, product.getId() + ".jpg");
	    		System.out.println("path converted to string" + product.getId());
	        return new ModelAndView("redirect:/getProduct");
	        
	    }
		
		  @RequestMapping("/updatepro-{id}")
	        public String modifyCategory(@PathVariable("id") String  id,Model m){
	    		
	            this.product=this.productDAO.getProduct(id);
	            m.addAttribute("product", productDAO.getProduct(id));
	            m.addAttribute("category",categoryDAO.getCategory(product.getCategoryid()));
	            m.addAttribute("supplier",supplierDAO.getSupplier(product.getSupplierid()));
	            m.addAttribute("supplierList", supplierDAO.getAllSuppliers());
	            m.addAttribute("categoryList", categoryDAO.getAllCategories());
	            System.out.println(productDAO.getProduct(id).getId());
	            return "Product";
	        }
	    	
	    	
	    	@RequestMapping("/deletepro-{id}")
	        public String deleteCategory(@PathVariable("id") String  id){
	    		
	            this.productDAO.deleteProduct(id);
	            return "redirect:/getProduct";
	        }
	    	
			
		}
	
