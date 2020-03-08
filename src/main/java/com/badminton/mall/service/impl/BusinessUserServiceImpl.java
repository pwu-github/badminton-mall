/**
 * FileName: BusinessUserServiceImpl
 * Author: WP
 * Date: 2020/3/8 18:37
 * Description:
 * History:
 **/
package com.badminton.mall.service.impl;

import com.badminton.mall.common.ServiceResultEnum;
import com.badminton.mall.dao.BusinessUserMapper;
import com.badminton.mall.entity.BusinessUser;
import com.badminton.mall.service.BusinessService;
import com.badminton.mall.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BusinessUserServiceImpl implements BusinessService {
    @Autowired
    private BusinessUserMapper businessUserMapper;
    @Override
    public BusinessUser businessLogin(String userName, String password) {
        String passwordMd5 = MD5Util.MD5Encode(password, "UTF-8");
        return businessUserMapper.login(userName, passwordMd5);
    }

    @Override
    public String register(String loginName, String password) {
        if (businessUserMapper.selectByLoginName(loginName) != null) {
            return ServiceResultEnum.SAME_LOGIN_NAME_EXIST.getResult();
        }
        BusinessUser businessUser = new BusinessUser();
        businessUser.setLoginName(loginName);
        businessUser.setNickName(loginName);
        String passwordMD5 = MD5Util.MD5Encode(password, "UTF-8");
        businessUser.setPassword(passwordMD5);
        if (businessUserMapper.insertSelective(businessUser) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }
}
