package com.nutro.nutro_delivery.controllers;


import com.nutro.nutro_delivery.domain.Product;
import com.nutro.nutro_delivery.domain.CategoryEnum;
import com.nutro.nutro_delivery.dto.request.ProductRequestDto;
import com.nutro.nutro_delivery.dto.response.ProductResponseDto;
import com.nutro.nutro_delivery.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    // Create a new product
    @PostMapping
    public ProductResponseDto createProduct(@RequestBody ProductRequestDto productRequestDto) {
        return productService.createProduct(productRequestDto);
    }

    // Search products by keyword (name or description)
    @GetMapping("/search")
    public List<Product> searchProducts(@RequestParam String keyword) {
        return productService.searchProducts(keyword);
    }

    // Get all available products
    @GetMapping
    public List<Product> getAllProducts() {
        return productService.getAllProducts();
    }

    // Get products by category
    @GetMapping("/category/{category}")
    public List<Product> getProductsByCategory(@PathVariable CategoryEnum category) {
        return productService.getProductsByCategory(category);
    }

    // Get product details by ID
    @GetMapping("/{id}")
    public Optional<ProductResponseDto> getProductById(@PathVariable Long id) {
        return productService.getProductById(id);
    }
}

