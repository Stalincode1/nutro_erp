package com.nutro.nutro_delivery.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nutro.nutro_delivery.domain.User;

public interface UserRepository extends JpaRepository<User, Long> {

}
