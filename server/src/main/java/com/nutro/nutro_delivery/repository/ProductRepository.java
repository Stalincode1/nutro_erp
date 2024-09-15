package com.nutro.nutro_delivery.repository;

import com.nutro.nutro_delivery.domain.Product;
import com.nutro.nutro_delivery.domain.CategoryEnum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    // Search products by name or description
    @Query("SELECT p FROM Product p WHERE p.name LIKE %:keyword% OR p.description LIKE %:keyword%")
    List<Product> searchProducts(String keyword);

    // Find products by category
    List<Product> findByCategory(CategoryEnum category);

    // Optional: Find products that are not deleted
    @Query("SELECT p FROM Product p WHERE p.isDeleted = false")
    List<Product> findAllAvailable();
}
