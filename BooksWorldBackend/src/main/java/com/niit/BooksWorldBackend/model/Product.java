package com.niit.BooksWorldBackend.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Component
@Table
public class Product
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO) //Automatically generate value for Id using sequence
private int id; //product.setId(0)
	
/*@NotEmpty(message="Product name is mandatory")*/
private String productname;//product.setProductName("pen")
/*@NotEmpty(message="Product description cannot be blank")*/
private String productDescription;

private int quantity;
/*@Min(value=10,message="Minimum price is 10")*/
private double price;
@ManyToOne
@JoinColumn(name="CID")
private Category category;//product.setCategory().setId(1)
@ManyToOne
@JoinColumn(name="SID")
private Supplier supplier;

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getProductname() {
	return productname;
}
public void setProductname(String productname) {
	this.productname = productname;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public String getProductDescription() {
	return productDescription;
}
public void setProductDescription(String productDescription) {
	this.productDescription = productDescription;
}
public Category getCategory() {
	return category;
}
public void setCategory(Category category) {
	this.category = category;
}
public Supplier getSupplier() {
	return supplier;
}
public void setSupplier(Supplier supplier) {
	this.supplier = supplier;
}



}
