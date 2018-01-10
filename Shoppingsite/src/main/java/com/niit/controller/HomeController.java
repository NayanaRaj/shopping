package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.Categorydao;
import com.niit.dao.Productdao;
import com.niit.model.Category;
import com.niit.model.Product;

@Controller
public class HomeController {
	
	@Autowired
	private Product product;
	@Autowired
	Productdao productDAO;
	@Autowired
	Categorydao categoryDAO;
	@Autowired
	Category category;
	
/*	@RequestMapping("/aboutus")
	public ModelAndView aboutus()
	{
		ModelAndView mv = new ModelAndView("/aboutus");
		return mv;
	}
	*/
	

		@RequestMapping(value="/")
		public String home(Model model)
		{
			model.addAttribute("product", product);
			model.addAttribute("hproList", this.productDAO.getAllProducts());
			model.addAttribute("hcatlist", this.categoryDAO.getAllCategories());		
			return "home";
		}

		@RequestMapping("/home")
		public String  homepage(Model model)
		{
			model.addAttribute("product", product);
			model.addAttribute("hproList", this.productDAO.getAllProducts());
			model.addAttribute("hcatlist", this.categoryDAO.getAllCategories());	
			return "home";

		}
		@RequestMapping("/aboutus")
		public String about()
		{
		return "AboutUs";
		}
		@RequestMapping("/contact")
		public String pub() {
			return "contactus";
		}
}
