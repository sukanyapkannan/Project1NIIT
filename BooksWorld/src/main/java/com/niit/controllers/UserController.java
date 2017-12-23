package com.niit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.BooksWorldBackend.DAO.UserDao;
import com.niit.BooksWorldBackend.model.User;

@Controller
public class UserController 
{
@Autowired
UserDao userDao;
@RequestMapping(value="/saveUser", method=RequestMethod.POST)
public String userReg(@RequestParam("email")String email,@RequestParam("psw") String password ,@RequestParam("phone")long phone,@RequestParam("address")String address)
{
	System.out.println("In Registration...");
	User user=new User();
	user.setEmail(email);
	user.setPhone(phone);
	user.setAddress(address);
	user.setPassword(password);
	user.setRole("ROLE_USER");
	userDao.saveUser(user);

	
	return "LoginPage";
}
}
