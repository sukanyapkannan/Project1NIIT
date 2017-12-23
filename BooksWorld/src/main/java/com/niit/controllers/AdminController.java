package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.BooksWorldBackend.DAO.CategoryDao;
import com.niit.BooksWorldBackend.DAO.ProductDao;
import com.niit.BooksWorldBackend.DAO.SupplierDao;
import com.niit.BooksWorldBackend.model.Supplier;

@Controller
public class AdminController 
{
	@Autowired
	CategoryDao catDao;
	@Autowired
	SupplierDao supDao;
	@Autowired
	ProductDao proDao;
	
	@RequestMapping("/Admin")
	String Admina(Model m)
	{
		
		return "redirect:/admin/Admin";
	}
	@RequestMapping("/admin")
	String index(Model m)
	{
		
		return "redirect:/";
	}

	@RequestMapping("/admin/Admin")
	String Admin(Model m)
	{
		m.addAttribute("clist", catDao.getCategorys());
		m.addAttribute("slist", supDao.getSuppliers());
		m.addAttribute("plist", proDao.getProducts());
		return "Admin";
	}

}
