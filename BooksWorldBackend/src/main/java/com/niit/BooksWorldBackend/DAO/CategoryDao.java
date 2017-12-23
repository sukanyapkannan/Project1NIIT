package com.niit.BooksWorldBackend.DAO;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.niit.BooksWorldBackend.model.Category;


public interface CategoryDao
{
		
void saveCategory(Category c);
void updateCategory(Category c);
void deleteCategory(Category c);
List<Category> getCategorys();
Category getCategory(int catId);

}
