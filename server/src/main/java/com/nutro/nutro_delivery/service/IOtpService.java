package com.nutro.nutro_delivery.service;

public interface IOtpService {
    String generateOtp(String mobileNumber);

    boolean verifyOtp(String mobileNumber, String otp);
}
