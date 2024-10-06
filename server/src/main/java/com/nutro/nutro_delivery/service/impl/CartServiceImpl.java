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

import java.util.ArrayList;
import java.util.List;

@Service
public class CartServiceImpl implements ICartService {

    @Autowired
    CartRepository cartRepository;

    @Autowired
    QuantityRepository quantityRepository;

    @Autowired
    private ProductRepository productRepository;

    public List<CartResponseDto> getAllCartProduct(Long id) {
        List<AddToCart> cart = cartRepository.findByUserId(id);
        List<CartResponseDto> cartResponseDtoList = new ArrayList<>();

        for (AddToCart addToCart : cart) {
            Product product = productRepository.findById(addToCart.getProductId()).orElse(null);

            if (product == null) {
                continue;
            }

            Quantity quantity = quantityRepository.findById(product.getQuantity().getId()).orElse(null);

            if (quantity == null) {
                continue;
            }

            ProductResponseDto productResponseDto = new ProductResponseDto();
            productResponseDto.setId(product.getId());
            productResponseDto.setName(product.getName());
            productResponseDto.setDescription(product.getDescription());
            productResponseDto.setCurrentStock(product.getCurrentStock());
            productResponseDto.setCategory(product.getCategory());
            productResponseDto.setPrice(quantity.getPrice());
            productResponseDto.setImages(product.getImages());

            CartResponseDto cartResponseDto = new CartResponseDto();
            cartResponseDto.setId(addToCart.getId());
            cartResponseDto.setIsCheckout(addToCart.getIsCheckout());
            cartResponseDto.setQuantity(addToCart.getQuantity());
            cartResponseDto.setProduct(productResponseDto);

            cartResponseDtoList.add(cartResponseDto);
        }

        return cartResponseDtoList;
    }

}
