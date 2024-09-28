package com.nutro.nutro_delivery.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nutro.nutro_delivery.domain.AddToCart;
import java.util.List;

public interface CartRepository extends JpaRepository<AddToCart, Long> {

    List<AddToCart> findByUserId(Long userId);

}
