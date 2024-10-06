package com.nutro.nutro_delivery.service;

import java.util.List;

import com.nutro.nutro_delivery.dto.response.CartResponseDto;

public interface ICartService {

    List<CartResponseDto> getAllCartProduct(Long id);

}
