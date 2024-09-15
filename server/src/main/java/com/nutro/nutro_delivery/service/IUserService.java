package com.nutro.nutro_delivery.service;

import com.nutro.nutro_delivery.domain.User;

public interface IUserService {
    String handleUserLogin(String phoneNumber);

    User getUserByPhoneNumber(String phoneNumber);
}
