package com.niit.BooksWorldBackend.DaoImpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.BooksWorldBackend.DAO.UserDao;
import com.niit.BooksWorldBackend.model.Supplier;
import com.niit.BooksWorldBackend.model.User;

@Repository
public class UserDaoImpl  implements UserDao
{
	@Autowired
	private SessionFactory sessionF;
	
	
	public UserDaoImpl(SessionFactory sessionF) {
		super();
		this.sessionF = sessionF;
	}

	
	public UserDaoImpl() {
		super();
	}


	public void saveUser(User u) 
	{
		System.out.println("in saveUser"+u.getEmail());
		Session s=sessionF.openSession();
		s.beginTransaction();
		s.save(u);
		s.getTransaction().commit();
		s.close();
		
	}

	public User getUser(String mailid) 
	{
		Session k=sessionF.openSession();
		User c=(User)k.get(User.class, mailid);
		return c;
	}


}
