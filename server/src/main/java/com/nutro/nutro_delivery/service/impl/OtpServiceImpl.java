package com.nutro.nutro_delivery.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nutro.nutro_delivery.domain.User;
import com.nutro.nutro_delivery.repository.UserRepository;
import com.nutro.nutro_delivery.service.IOtpService;

@Service
public class OtpServiceImpl implements IOtpService {

    @Autowired
    UserRepository repository;

    private final Map<String, String> otpStorage = new HashMap<>();

    public String generateOtp(String phoneNumber) {
        String otp = String.format("%04d", new Random().nextInt(9999));

        User user = repository.findByPhoneNo(phoneNumber);

        if (user == null) {
            // If user doesn't exist, create a new user
            user = new User();
            user.setPhoneNo(phoneNumber);
            repository.save(user);
        }

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
