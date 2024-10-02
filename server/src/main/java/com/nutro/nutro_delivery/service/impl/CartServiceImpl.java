package com.nutro.nutro_delivery.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nutro.nutro_delivery.domain.AddToCart;
import com.nutro.nutro_delivery.domain.Product;
import com.nutro.nutro_delivery.domain.Quantity;
import com.nutro.nutro_delivery.dto.response.CartResponseDto;
import com.nutro.nutro_delivery.dto.response.ProductResponseDto;
import com.nutro.nutro_delivery.repository.CartRepository;
import com.nutro.nutro_delivery.repository.ProductRepository;
import com.nutro.nutro_delivery.repository.QuantityRepository;
import com.nutro.nutro_delivery.service.ICartService;
import java.util.List;

@Service
public class CartServiceImpl implements ICartService {

    @Autowired
    CartRepository cartRepository;

    @Autowired
    QuantityRepository quantityRepository;

    @Autowired
    private ProductRepository productRepository;

    public CartResponseDto getAllCartProduct(Long id) {
        List<AddToCart> cart = cartRepository.findByUserId(id);
        CartResponseDto cartResponseDto = new CartResponseDto();

        for (AddToCart addToCart : cart) {
            // Fetch product details
            Product product = productRepository.findById(addToCart.getProductId()).orElse(null);

            if (product == null) {
                // Handle the case where the product is not found
                continue; // or return some kind of error message
            }

            // Fetch quantity details
            Quantity quantity = quantityRepository.findById(product.getQuantity().getId()).orElse(null);

            if (quantity == null) {
                // Handle the case where the quantity is not found
                continue; // or return some kind of error message
            }

            ProductResponseDto productResponseDto = new ProductResponseDto();
            productResponseDto.setId(product.getId());
            productResponseDto.setName(product.getName());
            productResponseDto.setDescription(product.getDescription());
            productResponseDto.setCurrentStock(product.getCurrentStock());
            productResponseDto.setPrice(quantity.getPrice());
            productResponseDto.setImages(product.getImages());

            cartResponseDto.setId(addToCart.getId());
            cartResponseDto.setIsCheckout(addToCart.getIsCheckout());
            cartResponseDto.setQuantity(addToCart.getQuantity());
            cartResponseDto.setProduct(productResponseDto);
        }

        return cartResponseDto;
    }

}
