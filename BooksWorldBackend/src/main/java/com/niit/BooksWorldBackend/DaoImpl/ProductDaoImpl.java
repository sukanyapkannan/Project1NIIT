package com.niit.BooksWorldBackend.DaoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.BooksWorldBackend.DAO.ProductDao;
import com.niit.BooksWorldBackend.model.Product;
import com.niit.BooksWorldBackend.model.Supplier;
@Repository
public class ProductDaoImpl implements ProductDao
{
	@Autowired
	private SessionFactory sessionF;
	public ProductDaoImpl(SessionFactory sessionF)
	{
		super();
		this.sessionF=sessionF;
	}
	public ProductDaoImpl()
	{
		super();
		
	}
	public void saveProduct(Product p) 
	{
		Session k=sessionF.openSession();
		k.beginTransaction();
		k.save(p);
		k.getTransaction().commit();
		k.close();
		
		
	}
	public void updateProduct(Product p) 
	{
		Session k=sessionF.openSession();
		 k.beginTransaction();
		k.update(p);
		k.flush();
		k.getTransaction().commit();
		k.close();
			
	}
	public void deletProdudct(Product p) 
	{
		Session k=sessionF.openSession();
		k.beginTransaction();
		k.delete(p);
		k.getTransaction().commit();
		k.close();	
	}
	public List<Product> getProducts()
	{
		Session s=sessionF.openSession();
		List<Product> plist=s.createQuery("from Product").list();
		return plist;
	}
	public Product getProduct(int id)
	{
		Session s=sessionF.openSession();
		Product p=(Product)s.get(Product.class,id);
		return p;
	}
	
}
