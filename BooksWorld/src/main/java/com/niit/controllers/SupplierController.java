package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.BooksWorldBackend.DAO.SupplierDao;
import com.niit.BooksWorldBackend.model.Supplier;

@Controller
public class SupplierController 
{
	@Autowired
	SupplierDao supDao;
	@RequestMapping("/admin/Supplier")
	String Supplier(Model m)
	{
		List<Supplier> slist=(List<Supplier>) supDao.getSuppliers();
		System.out.println(slist);
		m.addAttribute("slist", supDao.getSuppliers());
		return "Supplier";
	}
	@RequestMapping(value="/admin/saveSup")
	String saveSupplier(@RequestParam("SupName")String supName,@RequestParam("SupAddress")String supAddress)
	{
		Supplier s=new Supplier();
		s.setSupName(supName);
		s.setSupAddress(supAddress);
		supDao.saveSupplier(s);
		return "redirect:/Admin";
	}
	@RequestMapping(value="/admin/DeleteSup")
	String DeleteSupplier(@RequestParam("supId") int supId)
	{
		Supplier s=supDao.getSupplier(supId);
		supDao.deletSupplier(s);
		return "redirect:/Admin";
	}
	@RequestMapping(value="/admin/UpdateSup")
	String updateSupplier(@RequestParam("supId") int supId,Model m)
	{
		Supplier s=supDao.getSupplier(supId);
		m.addAttribute("supp", s);
		return "SupplierUp";
	}
	@RequestMapping(value="/admin/editSup")
	String editSupplier(@RequestParam("SupName")String supName,@RequestParam("SupAddress")String supAddress)
	{
		Supplier s=new Supplier();
		s.setSupName(supName);
		s.setSupAddress(supAddress);
		supDao.saveSupplier(s);
		return "redirect:/Admin";
	}
}
