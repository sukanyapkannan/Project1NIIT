package com.niit.BooksWorldBackend.DAO;

import java.util.List;

import com.niit.BooksWorldBackend.model.Product;



public interface ProductDao 
{
	void saveProduct(Product p);
	void updateProduct(Product p);
	void deletProdudct(Product p);
	List<Product> getProducts();
	Product getProduct(int id);

}
