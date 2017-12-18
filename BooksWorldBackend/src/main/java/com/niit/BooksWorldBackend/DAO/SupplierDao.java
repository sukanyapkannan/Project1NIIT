package com.niit.BooksWorldBackend.DAO;
import java.util.*;

import com.niit.BooksWorldBackend.model.Supplier;

public interface SupplierDao 
{
void saveSupplier(Supplier s);
void updateSupplier(Supplier s);
void deletSupplier(Supplier s);
List<Supplier> getSuppliers();
Supplier getSupplier(int supId);

}
