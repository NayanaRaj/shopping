package com.niit.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.springframework.stereotype.Component;

	@Entity
	@Table
	@Component
	public class User {
		@Id
		private String Username;
		private String Email ;
		private String Password;
		private int    Contactno;
		private String role;
		
		public User() {
			role="User";
		}
		
		public String getUsername() {
			return Username;
		}
		public void setUsername(String username) {
			Username = username;
		}
		public String getEmail() {
			return Email;
		}
		public void setEmail(String email) {
			Email = email;
		}
		public String getPassword() {
			return Password;
		}
		public void setPassword(String password) {
			Password = password;
		}
		public int getContactno() {
			return Contactno;
		}
		public void setContactno(int contactno) {
			Contactno = contactno;
		}
		
}


