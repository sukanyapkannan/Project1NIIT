package com.niit.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController 
{
	@RequestMapping("/")
	String index()
	{
		System.out.println("Login");
		return "BooksWorldHomePage";
	}
	@RequestMapping("/SignUp")
	String sign(Model m)
	{
		m.addAttribute("msg", "This is Registration Page..............");
		
		return "SignUpPage";
	}
	
	@RequestMapping("/Login")
	String Login(Model m)
	{
		//m.addAttribute("msg", "This is Registration Page..............");
		
		return "LoginPage";
	}
	
	
	
	@RequestMapping("/mdemo")
	ModelAndView modelandView()
	{
		ModelAndView m=new ModelAndView("register");
		m.addObject("msg", "This is Registration Page...with ModelAndView Class...........");
		
		return m;
	}
	@RequestMapping("/path/{name}")
	ModelAndView pathvariable(@PathVariable("name") String name)
	{
		ModelAndView m=new ModelAndView("NewFile");
		m.addObject("msg","Hai..."+name+ "This is Registration Page...with ModelAndView Class...........");
		
		return m;
	}
	@RequestMapping("/save")
	ModelAndView save(@RequestParam("name") String name,@RequestParam("age") int age)
	{
		ModelAndView m=new ModelAndView("register");
		m.addObject("msg","Hai..."+name+ " and Your Age is "+age+" ...This is Registration Page...with ModelAndView Class...........");
		
		return m;
	}
}
