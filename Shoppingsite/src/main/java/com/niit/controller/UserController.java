package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.Userdao;
import com.niit.model.User;

@Controller
public class UserController {
	@Autowired
	private Userdao userDao;
	@Autowired
	private User user;
	
	@RequestMapping("/admin")
	public String adminpage()
	{
		return "admin";
	}
		@RequestMapping("/login")
		public String user()
		{
			return "login";
		}
		@RequestMapping("/Registration")
		public String update()
		{
			return "Registration";
		}
		
		
		@ModelAttribute("user")
		public User getUserForm() {
		    return new User();
		}
		@RequestMapping(value = "/Register", method = RequestMethod.POST)
	    public ModelAndView saveEmployee(@ModelAttribute User user) {
//	        if(user.getUsername()=="")
//	        {
	            userDao.addUser(user);
//	        } else {
//	           userDao.updateUser(user);
//	        }
	        return new ModelAndView("redirect:/");
	    }
		 @RequestMapping(value = "/loginUser")
		    public String login(@RequestParam(value="error", required = false) String error, @RequestParam(value="logout",
		            required = false) String logout, Model model) {
		        if (error!=null) {
		        	System.out.println("Error.....");
		            model.addAttribute("error", "...Invalid username and password");
		        }
		        	
		        if(logout!=null) {
		        	System.out.println("Logout called.....");
		            model.addAttribute("msg", "...You have been logged out");
		        }

		        return "login";
		 }
}
