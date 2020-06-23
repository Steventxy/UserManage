package net.system.usermanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author TanXY
 * @create 2020/6/7 - 17:41
 */
@Controller
@RequestMapping("/menu")
public class MenuController {
    @GetMapping
    public String menuList(){
        return "menu/menu";
    }
}
