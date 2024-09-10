package com.nutro.nutro_delivery.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nutro.nutro_delivery.common.ServerResponseModel;
import com.nutro.nutro_delivery.domain.User;
import com.nutro.nutro_delivery.dto.request.UserRequestDto;
import com.nutro.nutro_delivery.repository.UserRepository;

import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;
import java.time.LocalDateTime;

@RestController
@RequestMapping(value = "users")
public class UserController {

    @Autowired
    UserRepository repository;

    @PostMapping("/create-user")
    private ResponseEntity<ServerResponseModel> createUser(@RequestBody UserRequestDto requestDto) {
        ServerResponseModel res = new ServerResponseModel();

        try {
            // Convert UserRequestDto to User entity
            User user = new User();
            user.setName(requestDto.getName());
            user.setPhoneNo(requestDto.getPhoneNo());
            user.setEmail(requestDto.getEmail());
            user.setIsAdmin(requestDto.getIsAdmin());
            user.setGender(requestDto.getGender());

            User savedUser = repository.save(user);

            // Prepare success response
            res.setData(savedUser);
            res.setMessage("User created successfully");
            res.setStatus(HttpStatus.OK.value());

            return new ResponseEntity<>(res, HttpStatus.OK);

        } catch (Exception e) {
            // Handle exceptions
            res.setMessage("Error creating user: " + e.getMessage());
            res.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());

            return new ResponseEntity<>(res, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/get-user")
    public String getMethodName() {
        System.out.println("User api Called");
        return new String();
    }

}
