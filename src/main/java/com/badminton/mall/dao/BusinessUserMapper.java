package com.badminton.mall.dao;

import com.badminton.mall.entity.BusinessUser;
import org.apache.ibatis.annotations.Param;

public interface BusinessUserMapper {
    BusinessUser login(@Param("userName") String userName, @Param("password") String passwordMd5);

    BusinessUser selectByLoginName(String loginName);

    int insertSelective(BusinessUser businessUser);

    BusinessUser selectByPrimaryKey(Integer loginUserId);

    int updateByPrimaryKeySelective(BusinessUser businessUser);
}
