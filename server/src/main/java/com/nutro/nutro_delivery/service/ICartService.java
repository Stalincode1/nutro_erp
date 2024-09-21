package com.nutro.nutro_delivery.service;

import com.nutro.nutro_delivery.dto.response.CartResponseDto;

public interface ICartService {

    CartResponseDto getAllCartProduct(Long id);

}
