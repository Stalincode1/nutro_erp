package com.nutro.nutro_delivery.controllers;

import java.util.Collections;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.*;

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
    public ResponseEntity<?> generateOtp(@RequestBody Map<String, String> request) {
        String phoneNumber = request.get("phoneNumber");
        if (phoneNumber == null || phoneNumber.isEmpty()) {
            return ResponseEntity.badRequest().body("Phone number is required");
        }
        String otp = otpService.generateOtp(phoneNumber);
        // TODO: Implement sending OTP via SMS or Email
        return ResponseEntity.ok("OTP has been sent to your phone.");
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