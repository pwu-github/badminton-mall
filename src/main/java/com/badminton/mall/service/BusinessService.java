package com.badminton.mall.service;


import com.badminton.mall.entity.BusinessUser;

public interface BusinessService {
    BusinessUser businessLogin(String userName, String password);

    String register(String loginName, String password);
}
