/**
 * FileName: BusinessController
 * Author: WP
 * Date: 2020/3/8 17:37
 * Description:
 * History:
 **/
package com.badminton.mall.controller.mall;

import com.badminton.mall.common.Constants;
import com.badminton.mall.common.ServiceResultEnum;
import com.badminton.mall.entity.AdminUser;
import com.badminton.mall.entity.BusinessUser;
import com.badminton.mall.service.AdminUserService;
import com.badminton.mall.service.BusinessService;
import com.badminton.mall.util.Result;
import com.badminton.mall.util.ResultGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/business")
public class BusinessController {
    @Resource
    private AdminUserService adminUserService;
    @Resource
    private BusinessService businessService;

    @GetMapping("/login")
    public String loginPage() {
        return "business/login";
    }

    @GetMapping("/register")
    public String registerPage() {
        return "business/register";
    }

    @GetMapping({"", "/", "/index", "/index.html"})
    public String index(HttpServletRequest request) {
        request.setAttribute("businessPath", "index");
        return "business/index";
    }

    @PostMapping("/login")
    public String login(@RequestParam("userName") String userName,
                        @RequestParam("password") String password,
                        @RequestParam("verifyCode") String verifyCode,
                        HttpSession session) {
        if (StringUtils.isEmpty(verifyCode)) {
            session.setAttribute("errorMsg", "验证码不能为空");
            return "business/login";
        }
        if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)) {
            session.setAttribute("errorMsg", "用户名或密码不能为空");
            return "business/login";
        }
//        String kaptchaCode = session.getAttribute("verifyCode") + "";
        String kaptchaCode = session.getAttribute(Constants.MALL_VERIFY_CODE_KEY) + "";
        if (StringUtils.isEmpty(kaptchaCode) || !verifyCode.equals(kaptchaCode)) {
            session.setAttribute("errorMsg", "验证码错误");
            return "business/login";
        }
        AdminUser adminUser = adminUserService.login(userName, password);
        BusinessUser businessUser = businessService.businessLogin(userName,password);
        if (adminUser != null) {
            session.setAttribute("loginUser", adminUser.getNickName());
            session.setAttribute("loginUserId", adminUser.getAdminUserId());
            //session过期时间设置为7200秒 即两小时
            //session.setMaxInactiveInterval(60 * 60 * 2);
            return "redirect:/admin/index";
        }
        if (businessUser != null){
            session.setAttribute("loginUser", businessUser.getNickName());
            session.setAttribute("loginUserId", businessUser.getBusinessUserId());
            //session过期时间设置为7200秒 即两小时
            //session.setMaxInactiveInterval(60 * 60 * 2);
            return "redirect:/business/index";
        }
        session.setAttribute("errorMsg", "登陆失败，您不是管理员或商家用户！");
        return "business/login";
    }

    @PostMapping("/register")
    @ResponseBody
    public Result register(@RequestParam("loginName") String loginName,
                           @RequestParam("verifyCode") String verifyCode,
                           @RequestParam("password") String password,
                           HttpSession httpSession) {
        if (StringUtils.isEmpty(loginName)) {
            return ResultGenerator.genFailResult(ServiceResultEnum.LOGIN_NAME_NULL.getResult());
        }
        if (StringUtils.isEmpty(password)) {
            return ResultGenerator.genFailResult(ServiceResultEnum.LOGIN_PASSWORD_NULL.getResult());
        }
        if (StringUtils.isEmpty(verifyCode)) {
            return ResultGenerator.genFailResult(ServiceResultEnum.LOGIN_VERIFY_CODE_NULL.getResult());
        }
        String kaptchaCode = httpSession.getAttribute(Constants.MALL_VERIFY_CODE_KEY) + "";
        if (StringUtils.isEmpty(kaptchaCode) || !verifyCode.equals(kaptchaCode)) {
            return ResultGenerator.genFailResult(ServiceResultEnum.LOGIN_VERIFY_CODE_ERROR.getResult());
        }
        //todo 清verifyCode
        String registerResult = businessService.register(loginName, password);
        //注册成功
        if (ServiceResultEnum.SUCCESS.getResult().equals(registerResult)) {
            return ResultGenerator.genSuccessResult();
        }
        //注册失败
        return ResultGenerator.genFailResult(registerResult);
    }
}
