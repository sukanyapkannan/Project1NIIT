package com.niit.BooksWorldBackend.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;


import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


@Entity
@Component
@Table
public class Category implements Serializable
{
	private static final long serialVersionUID=1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int catId;
	
	
/*@NotEmpty(message="Category name is mandatory")*/
private String catName;

/*@NotEmpty(message="Category description cannot be blank")*/
private String catdescription;

@OneToMany(targetEntity=Product.class,fetch=FetchType.EAGER,mappedBy="category")
private Set<Product> product;
 

public int getCatId() {
	return catId;
}
public void setCatId(int catId) {
	this.catId = catId;
}
public String getCatName() {
	return catName;
}
public void setCatName(String catName) {
	this.catName = catName;
}
public String getCatdescription() {
	return catdescription;
}
public void setCatdescription(String catdescription) {
	this.catdescription = catdescription;
}
public Set<Product> getProduct() {
	return product;
}
public void setProduct(Set<Product> product) {
	this.product = product;
}



}
