package com.nutro.nutro_delivery.controllers;

import java.util.Collections;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.*;

import com.nutro.nutro_delivery.common.ServerResponseModel;
import com.nutro.nutro_delivery.security.JwtUtil;
import com.nutro.nutro_delivery.service.IOtpService;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private IOtpService otpService;

    @Autowired
    private JwtUtil jwtUtil;

    @PostMapping("/generate-otp")
    public ResponseEntity<ServerResponseModel> generateOtp(@RequestBody Map<String, String> request) {
        String phoneNumber = request.get("phoneNumber");
        if (phoneNumber == null || phoneNumber.isEmpty()) {
            ServerResponseModel res = new ServerResponseModel();
            res.setStatus(HttpStatus.BAD_REQUEST.value());
            res.setMessage("Phone Number Can't Be Empty");
            return new ResponseEntity<>(res, HttpStatus.BAD_REQUEST);
        }

        String otp = otpService.generateOtp(phoneNumber);

        java.util.Map<String, Object> responseData = new java.util.HashMap<>();
        responseData.put("otp", otp);
        responseData.put("phoneNumber", phoneNumber);

        ServerResponseModel res = new ServerResponseModel();
        res.setStatus(HttpStatus.OK.value());
        res.setMessage("Successfully OTP Sent");
        res.setData(responseData); // Set the Map as data

        return new ResponseEntity<>(res, HttpStatus.OK);
    }

    @PostMapping("/verify-otp")
    public ResponseEntity<?> verifyOtp(@RequestBody Map<String, String> request) {
        String phoneNumber = request.get("phoneNumber");
        String otp = request.get("otp");

        if (otpService.verifyOtp(phoneNumber, otp)) {
            String jwtToken = jwtUtil.generateToken(phoneNumber);
            return ResponseEntity.ok(Collections.singletonMap("token", jwtToken));
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid OTP");
        }
    }
}