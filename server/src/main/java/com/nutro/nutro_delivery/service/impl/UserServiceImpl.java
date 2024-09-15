package com.nutro.nutro_delivery.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nutro.nutro_delivery.domain.User;
import com.nutro.nutro_delivery.repository.UserRepository;

import com.nutro.nutro_delivery.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public String handleUserLogin(String phoneNumber) {
        User userOpt = userRepository.findByPhoneNo(phoneNumber);

        User user;
        if (userOpt == null) {
            user = new User();
            user.setPhoneNo(phoneNumber);

            user = userRepository.save(user);
        } else {
            user = userOpt;
        }

        // String otp = otpService.generateOtp();
        // user.setOtp(otp);
        // userRepository.save(user);

        // otpService.sendOtp(phoneNumber, otp);
        return "OK";
    }
}
