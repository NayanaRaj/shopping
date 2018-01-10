package com.niit.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.Categorydao;
import com.niit.model.Category;


@Controller
public class Categorycontroller {

	@Autowired
	private Categorydao categoryDAO;
	@Autowired
	private Category category;
	
	@RequestMapping("/category")
	public String prform(Model model) {
		//model.addAttribute("productList", this.productDAO.getAllProducts());
		return "Category";
	}
	
	@RequestMapping("/getcategories")
	public String Listcategory(Model model) {
		model.addAttribute("categoryList", this.categoryDAO.getAllCategories());
		List<Category> cl=this.categoryDAO.getAllCategories();
		for(Category c:cl)
		System.out.println(c.getCategoryid());
		return "Category";
	}
	
		@ModelAttribute("category")
		public Category getprForm() {
		    return new Category();
		}
		@RequestMapping(value = "/addcategory", method = RequestMethod.POST)
	    public ModelAndView saveCategory(@ModelAttribute("category") Category category) {
			
			System.out.println(category.getCategoryid());
			System.out.println(category.getCategoryname());
			categoryDAO.addCategory(category);
		
	        return new ModelAndView("redirect:/getcategories");
		}
	       
	        @RequestMapping(value= "/Category", method = RequestMethod.POST)
	    	public String addCategory(@ModelAttribute("Category") Category c){
	    		
//	    		if(c.getCategoryid() == 0){
	    			//new category, add it
	    			this.categoryDAO.addCategory(c);
//	    		}else{
//	    			//existing category, call update
//	    			this.categoryDAO.updateCategory(c);
//	    		}
	    		
	    		return "redirect:/getcategories";
	    		
	    		
	    	}
	        @RequestMapping("/editcategory-{categoryid}")
	        public String modifyCategory(@PathVariable("categoryid") String  categoryid,Model m){
	    		
	            this.category=this.categoryDAO.getCategory(categoryid);
	            m.addAttribute("category", this.category);
	            System.out.println(categoryDAO.getCategory(categoryid).getCategoryid());
	            return "Category";
	        }
	    	
	    	
	    	@RequestMapping("/delete-{categoryid}")
	        public String deleteCategory(@PathVariable("categoryid") String  categoryid){
	    		
	            this.categoryDAO.deleteCategory(categoryid);
	            return "redirect:/getcategories";
	        }
	    	
	    }
	
