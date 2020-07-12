package net.system.usermanage.controller;

import com.ramostear.captcha.HappyCaptcha;
import com.ramostear.captcha.support.CaptchaStyle;
import com.ramostear.captcha.support.CaptchaType;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author TanXY
 * @create 2020/6/1 - 11:22
 * @description
 */
@Controller
public class LoginController {

    @GetMapping()
    public String toLogin(){
        return "redirect:login";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @ResponseBody
    @PostMapping("/toLogin")
    public String toLogin(HttpServletRequest request, Model model){
        String loginName = request.getParameter("loginName");
        String pwd = request.getParameter("password");
        String code = request.getParameter("verifyCode");
        Subject subject = SecurityUtils.getSubject();
        AuthenticationToken token = new UsernamePasswordToken(loginName,pwd);
        try {
            subject.login(token);
            boolean flag = HappyCaptcha.verification(request,code,true);
            if (flag) {//验证码正确
                return "1";
            }
            else//验证码错误
                return "3";
//                request.getSession().setAttribute("msg","验证码错误");
        } catch (IncorrectCredentialsException e) { //密码不匹配
            e.printStackTrace();
            model.addAttribute("msg","账号或密码错误");
            request.getSession().setAttribute("msg","账号或密码错误");
            return "2";
        } catch (UnknownAccountException e){ //账户不存在
            e.printStackTrace();
            model.addAttribute("msg","账号或密码错误");
            request.getSession().setAttribute("msg","账户不存在");
            return "4";
        }
//        return "login";
    }

    /**
     * @author TanXY
     * @description 获取图片验证码
     * @date 2020/6/1 11:22
     * @return void
     */
    @GetMapping("/verifyCode")
    public void getVerifyCode(HttpServletResponse response, HttpServletRequest request){
        HappyCaptcha.require(request,response)
                .type(CaptchaType.NUMBER) //中文计算
                .length(4)  //长度为4
                .style(CaptchaStyle.ANIM) //图片为动态
                .build().finish();
    }


}