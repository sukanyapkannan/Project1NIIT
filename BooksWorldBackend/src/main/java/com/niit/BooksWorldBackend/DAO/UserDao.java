package com.niit.BooksWorldBackend.DAO;

import com.niit.BooksWorldBackend.model.User;

public interface UserDao
{
	void saveUser(User u);
	
	User getUser(String mailid);

}
