package com.nutro.nutro_delivery.repository;
import com.nutro.nutro_delivery.domain.Quantity;

import org.springframework.data.jpa.repository.JpaRepository;

public interface QuantityRepository extends JpaRepository<Quantity, Long> {
}