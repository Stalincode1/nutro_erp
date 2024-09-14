package com.nutro.nutro_delivery.service;

import com.nutro.nutro_delivery.domain.Product;
import com.nutro.nutro_delivery.domain.Quantity;
import com.nutro.nutro_delivery.domain.CategoryEnum;
import com.nutro.nutro_delivery.dto.request.ProductRequestDto;
import com.nutro.nutro_delivery.dto.response.ProductResponseDto;
import com.nutro.nutro_delivery.repository.ProductRepository;
import com.nutro.nutro_delivery.repository.QuantityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private QuantityRepository quantityRepository;

    // Create a new product
    public ProductResponseDto createProduct(ProductRequestDto productRequestDto) {
        Product product = new Product();
        product.setName(productRequestDto.getName());
        product.setDescription(productRequestDto.getDescription());
        product.setCategory(productRequestDto.getCategory());
        product.setCurrentStock(productRequestDto.getCurrentStock());
        product.setImages(productRequestDto.getImages());

        // Handle Quantity entity
        Quantity quantity = new Quantity();
        quantity.setQuantity(productRequestDto.getQuantity());
        quantity.setPrice(productRequestDto.getPrice());
        quantityRepository.save(quantity); // Save Quantity entity

        product.setQuantity(quantity); // Associate Quantity with Product

        Product savedProduct = productRepository.save(product);

        return mapToResponseDto(savedProduct);
    }

    // Search products by keyword
    public List<Product> searchProducts(String keyword) {
        return productRepository.searchProducts(keyword);
    }

    // Get all products
    public List<Product> getAllProducts() {
        return productRepository.findAllAvailable();
    }

    // Get products by category
    public List<Product> getProductsByCategory(CategoryEnum category) {
        return productRepository.findByCategory(category);
    }

    // Get product details by ID
    public Optional<ProductResponseDto> getProductById(Long id) {
        Optional<Product> product = productRepository.findById(id);
        return product.map(this::mapToResponseDto);
    }

    // Helper method to map Product entity to ProductResponseDto
    private ProductResponseDto mapToResponseDto(Product product) {
        ProductResponseDto responseDto = new ProductResponseDto();
        responseDto.setId(product.getId());
        responseDto.setName(product.getName());
        responseDto.setDescription(product.getDescription());
        responseDto.setCategory(product.getCategory().name());
        responseDto.setCurrentStock(product.getCurrentStock());
        responseDto.setPrice(product.getQuantity() != null ? product.getQuantity().getPrice() : null);
        responseDto.setImages(product.getImages());
        return responseDto;
    }
}
