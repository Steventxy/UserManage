package net.system.usermanage.controller;

import net.system.usermanage.domain.Menu;
import net.system.usermanage.domain.User;
import net.system.usermanage.service.impl.MenuServiceImpl;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author TanXY
 * @create 2020/5/24 - 19:15
 * @description
 */
@Controller
public class MainController {

    @Autowired
    MenuServiceImpl menuService;

    @GetMapping("/index")
    public String index(Model model,HttpSession session){
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        List<Menu> menu = menuService.selectMenu(user.getUserId());
//        System.out.println(menu);
        model.addAttribute("menu",menu);
        return "index";
    }

    @GetMapping("/main")
    public String main(){
        return "main";
    }


}
