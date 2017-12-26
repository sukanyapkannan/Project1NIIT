package com.niit.controllers;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.BooksWorldBackend.DAO.CategoryDao;
import com.niit.BooksWorldBackend.DAO.ProductDao;
import com.niit.BooksWorldBackend.DAO.SupplierDao;
import com.niit.BooksWorldBackend.model.Category;
import com.niit.BooksWorldBackend.model.Product;
import com.niit.BooksWorldBackend.model.Supplier;

@Controller
public class ProductController 
{
@Autowired
ProductDao proDao;

@Autowired
CategoryDao cDao;

@Autowired
SupplierDao sDao;

@RequestMapping(value="/admin/saveProduct")
String saveProduct(@RequestParam("productname")String productname,@RequestParam("productDescription")String productDescription,@RequestParam("price")double price,@RequestParam("quantity")int quantity,@RequestParam("cid")int cid,@RequestParam("sid")int sid,@RequestParam("img")MultipartFile file)
{
	System.out.println("----------------------------------------");
	Product s=new Product();
	s.setProductname(productname);
	s.setProductDescription(productDescription);
	s.setPrice(price);
	s.setQuantity(quantity);
	s.setCategory(cDao.getCategory(cid));
	s.setSupplier(sDao.getSupplier(sid));
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
	return "redirect:/Admin";
}
@RequestMapping(value="/admin/DeleteProduct")
String DeleteProduct(@RequestParam("id") int id)
{
	Product s=proDao.getProduct(id);
	proDao.deletProdudct(s);
	return "redirect:/Admin";
}
@RequestMapping(value="/admin/UpdateProduct")
String UpdateProduct(@RequestParam("id") int id,Model m)
{
	Product s=proDao.getProduct(id);
	m.addAttribute("Prod", s);
	m.addAttribute("clist", cDao.getCategorys());
	m.addAttribute("slist", sDao.getSuppliers());
	return "ProductUp";
}
@RequestMapping(value="/admin/EditProduct")
String EditProduct(@RequestParam("productname")String productname,@RequestParam("productDescription")String productDescription,@RequestParam("price")double price,@RequestParam("quantity")int quantity,@RequestParam("cid")int cid,@RequestParam("sid")int sid,@RequestParam("img")MultipartFile file)
{
	System.out.println("----------------------------------------");
	Product s=new Product();
	s.setProductname(productname);
	s.setProductDescription(productDescription);
	s.setPrice(price);
	s.setQuantity(quantity);
	s.setCategory(cDao.getCategory(cid));
	s.setSupplier(sDao.getSupplier(sid));
	proDao.updateProduct(s);
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
	return "redirect:/Admin";
}


@RequestMapping(value="/proList",method=RequestMethod.GET)
public String productListByCat(@RequestParam("catId") int catId,Model m)
{
	
	

	m.addAttribute("clist",cDao.getCategorys());
	List<Product> listProduct=proDao.retrieveProductByCat(catId);
    m.addAttribute("plist",listProduct);
    
    return "ProductList";
}

@RequestMapping(value="productDescp")
public String showProductDesc(@RequestParam("id")int id,Model m)
{
    Product product=proDao.getProduct(id);
    m.addAttribute("p",product);
    return "ProductDescp";
}

}
