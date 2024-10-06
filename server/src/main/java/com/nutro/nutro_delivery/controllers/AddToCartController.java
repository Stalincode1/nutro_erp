package com.nutro.nutro_delivery.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nutro.nutro_delivery.common.ServerResponseModel;
import com.nutro.nutro_delivery.service.ICartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping(value = "cart")
public class AddToCartController {

    @Autowired
    ICartService cartService;

    @GetMapping("/get-all-products")
    public ResponseEntity<ServerResponseModel> getAllProducts() {
        System.out.println("it Hist");
        ServerResponseModel res = new ServerResponseModel();
        res.setStatus(HttpStatus.OK.value());
        res.setMessage("Product Fetched Succefully");
        res.setData(cartService.getAllCartProduct(1L));
        return new ResponseEntity<>(res, HttpStatus.OK);
    }

}
