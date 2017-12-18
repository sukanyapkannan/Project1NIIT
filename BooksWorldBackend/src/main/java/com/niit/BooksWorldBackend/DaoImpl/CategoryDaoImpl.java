package com.niit.BooksWorldBackend.DaoImpl;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.BooksWorldBackend.DAO.CategoryDao;
import com.niit.BooksWorldBackend.model.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao
{
@Autowired
private SessionFactory sessionF;
public CategoryDaoImpl(SessionFactory sessionF)
{
	super();
	this.sessionF=sessionF;
}
public CategoryDaoImpl()
{
	super();
	
}
public void saveCategory(Category u)
{
	Session s=sessionF.openSession();
	s.beginTransaction();
	s.save(u);
	s.getTransaction().commit();
	s.close();
	
}
public void updateCategory(Category c)
{
	Session s=sessionF.openSession();
	 s.beginTransaction();
	s.update(c);
	s.flush();
	s.getTransaction().commit();
	s.close();

}
public void deleteCategory(Category c)
{
	Session s=sessionF.openSession();
	s.beginTransaction();
	s.delete(c);
	s.getTransaction().commit();
	s.close();
}
public List<Category> getCategorys()
{
	Session s=sessionF.openSession();
	List<Category> clist=s.createQuery("from Category").list();	
	return clist;
}

public Category getCategory(int catId) 
{
	Session s=sessionF.openSession();
	Category c=(Category)s.get(Category.class, catId);
	return c;
}
}
