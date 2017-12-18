package com.niit.controllers;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.BooksWorldBackend.DAO.ProductDao;
import com.niit.BooksWorldBackend.model.Product;
import com.niit.BooksWorldBackend.model.Supplier;

@Controller
public class ProductController 
{
@Autowired
ProductDao proDao;
@RequestMapping(value="/ProductForm")
String Product(Model m)
{
	List<Product> plist=(List<Product>) proDao.getProducts();
	System.out.println(plist);
	m.addAttribute("plist", proDao.getProducts());
	return "ProductForm";
}
@RequestMapping(value="/saveProduct")
String saveProduct(@RequestParam("productname")String productname,@RequestParam("productDescription")String productDescription,@RequestParam("img")MultipartFile file)
{
	System.out.println("----------------------------------------");
	Product s=new Product();
	s.setProductname(productname);
	s.setProductDescription(productDescription);
	s.setPrice(45);
	s.setQuantity(5);
	proDao.saveProduct(s);
	String filepath="C:/Users/user/Downloads/gitHub-master/BooksWorld/src/main/webapp/resources/images/"+s.getId()+".jpg";
	
	System.out.println("------------------------------------------HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH-------------"+filepath);
	try {
		byte imagebyte[] = file.getBytes();
		BufferedOutputStream fos = new BufferedOutputStream(new FileOutputStream(filepath));
		fos.write(imagebyte);
		fos.close();
		System.out.println("Image Saved :"+filepath);
		}catch (Exception e) {
		System.out.println("Error Occured :"+e.getMessage());
		}
	return "redirect:/ProductForm";
}
@RequestMapping(value="/DeleteProduct")
String DeleteProduct(@RequestParam("id") int id)
{
	Product s=proDao.getProduct(id);
	proDao.deletProdudct(s);
	return "redirect:/ProductForm";
}
@RequestMapping(value="/UpdateProduct")
String UpdateProduct(@RequestParam("id") int id,Model m)
{
	Product s=proDao.getProduct(id);
	m.addAttribute("Product", s);
	return "ProductUp";
}
}
