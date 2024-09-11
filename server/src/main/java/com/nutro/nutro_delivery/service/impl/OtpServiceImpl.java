package com.nutro.nutro_delivery.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.stereotype.Service;

import com.nutro.nutro_delivery.service.IOtpService;

@Service
public class OtpServiceImpl implements IOtpService {
    private final Map<String, String> otpStorage = new HashMap<>();

    public String generateOtp(String phoneNumber) {
        String otp = String.valueOf(new Random().nextInt(999999));
        otpStorage.put(phoneNumber, otp);
        System.out.println("Generated OTP for " + phoneNumber + ": " + otp);
        return otp;
    }

    public boolean verifyOtp(String phoneNumber, String otp) {
        return otpStorage.containsKey(phoneNumber) && otpStorage.get(phoneNumber).equals(otp);
    }

    // Remove OTP after successful validation
    public void clearOtp(String mobileNumber) {
        otpStorage.remove(mobileNumber);
    }
}
