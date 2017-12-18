package com.niit.BooksWorldBackend.DaoImpl;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.BooksWorldBackend.DAO.SupplierDao;

import com.niit.BooksWorldBackend.model.Supplier;



@Repository
public class SupplierDaoImpl implements SupplierDao
{
@Autowired
private SessionFactory sessionF;
public SupplierDaoImpl(SessionFactory sessionF)
{
	super();
	this.sessionF=sessionF;
}
public SupplierDaoImpl()
{
	super();
	
}
public void saveSupplier(Supplier s) 
{
	Session k=sessionF.openSession();
	k.beginTransaction();
	k.save(s);
	k.getTransaction().commit();
	k.close();
	
}
public void updateSupplier(Supplier s)
{
	Session k=sessionF.openSession();
	 k.beginTransaction();
	k.update(s);
	k.flush();
	k.getTransaction().commit();
	k.close();
	
}
public void deletSupplier(Supplier s) 
{
	Session k=sessionF.openSession();
	k.beginTransaction();
	k.delete(s);
	k.getTransaction().commit();
	k.close();

}
public List<Supplier> getSuppliers()
{
	
	Session s=sessionF.openSession();
	List<Supplier> clist=s.createQuery("from Supplier").list();
	return clist;
}
public Supplier getSupplier(int supId)
{
	
	Session s=sessionF.openSession();
	Supplier c=(Supplier)s.get(Supplier.class, supId);
	return c;
}

}
