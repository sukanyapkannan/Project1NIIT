package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.BooksWorldBackend.DAO.CategoryDao;
import com.niit.BooksWorldBackend.model.Category;

@Controller
public class CategoryController 
{
	@Autowired
	CategoryDao catDao;
	@RequestMapping("/admin/Category")
	String category(Model m)
	{
		List<Category> clist=catDao.getCategorys();
	System.out.println(clist);
	m.addAttribute("clist", catDao.getCategorys());
		return "Category";
	}
	@RequestMapping(value="/admin/saveCat")
	String saveCategory(@RequestParam("catname")String catname,@RequestParam("catdescription")String catdescription)
	{
		Category c=new Category();
		c.setCatName(catname);
		c.setCatdescription(catdescription);
		catDao.saveCategory(c);
		return "redirect:/Admin";
	}
	
	@RequestMapping(value="/admin/editCat")
	String editCat(@RequestParam("catid")String catid,@RequestParam("catname")String catname,@RequestParam("catdescription")String catdescription)
	{
		Category c=new Category();
		c.setCatId(Integer.parseInt(catid));
		c.setCatName(catname);
		c.setCatdescription(catdescription);
		catDao.updateCategory(c);
		return "redirect:/Admin";
	}
	@RequestMapping(value="/admin/DeleteCat")
	String DeleteCat(@RequestParam("catId") int catId)
	{
		Category c=catDao.getCategory(catId);
		catDao.deleteCategory(c);
		return "redirect:/Admin";
	}
	@RequestMapping(value="/admin/UpdateCat")
	String updateCat(@RequestParam("catId") int catId,Model m)
	{
		Category c=catDao.getCategory(catId);
		m.addAttribute("cate", c);
		return "CategoryUp";
	}

}
