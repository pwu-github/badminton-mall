package com.badminton.mall.service;


import com.badminton.mall.entity.BusinessUser;

public interface BusinessService {
    BusinessUser businessLogin(String userName, String password);

    String register(String loginName, String password);

    BusinessUser getUserDetailById(Integer loginUserId);

    boolean updatePassword(Integer loginUserId, String originalPassword, String newPassword);

    boolean updateName(Integer loginUserId, String loginUserName, String nickName);
}
