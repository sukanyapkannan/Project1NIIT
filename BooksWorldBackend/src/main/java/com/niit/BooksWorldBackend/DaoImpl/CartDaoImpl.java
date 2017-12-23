package com.niit.BooksWorldBackend.DaoImpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.BooksWorldBackend.DAO.CartDao;
import com.niit.BooksWorldBackend.model.Cart;

@Repository
public class CartDaoImpl implements CartDao
{
	@Autowired
	SessionFactory sessionF;
	public CartDaoImpl(SessionFactory sessionFactory)
	{
		this.sessionF=sessionFactory;
	}
	public CartDaoImpl() 
	{
		super();
	}
	public void addCart(Cart cart)
	{
		Session session=sessionF.openSession();
		session.beginTransaction();
		session.persist(cart);
		session.getTransaction().commit();	
	}
	public void updateCart(Cart cart)
	{
		Session session=sessionF.openSession();
		session.beginTransaction();
		session.update(cart);
		session.getTransaction().commit();
	}
	public void deleteCart(Cart c)
	{
		Session session=sessionF.openSession();
		session.beginTransaction();
		session.delete(c);
		session.getTransaction().commit();
	}
	public Cart getCartItem(int cartID)
	{
		Session session=sessionF.openSession();
        Cart cart=(Cart)session.get(Cart.class, cartID);
        session.close();
        return cart;
	}
	public Cart getCartById(int pid,String userEmail)
	{
		Session session=sessionF.openSession();
		Cart cr=null;
		try
		{
			System.out.println("===========Product existence============="+cr);
			session.beginTransaction();
			cr=(Cart)session.createQuery("From Cart where USERMAILID =:email and PRODUCT_ID=:id")
					        .setString("email",userEmail)
					        .setInteger("id", pid)
					        .uniqueResult();
			session.getTransaction().commit();
			System.out.println("Cart: "+cr);
			return cr;
		}
		catch(HibernateException e)
		{
			System.out.println("===========ERROR============="+e.getMessage());
			session.getTransaction().rollback();
		}
		return cr;
	}
	public List<Cart> getCartItems(String username)
	{
		 Session session=sessionF.openSession();
	        List<Cart> cr=null;
	        try
	        {
	            session.beginTransaction();
	             
	            cr=(List<Cart>)session.createQuery("From Cart where USERMAILID='"+username+"'").list();
	            session.getTransaction().commit();
	        }
	        catch(HibernateException e)
	        {
	            session.getTransaction().rollback();
	        }
	        return cr;
	}	
}
