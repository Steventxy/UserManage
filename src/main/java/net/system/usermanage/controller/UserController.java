package net.system.usermanage.controller;

import net.system.usermanage.utils.TableInfo;
import net.system.usermanage.domain.User;
import net.system.usermanage.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author TanXY
 * @create 2020/5/23 - 17:18
 * @description
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserServiceImpl userService;
    private TableInfo tableInfo = new TableInfo();

    @GetMapping()
    public String user() {
        return "user/user";
    }

    @GetMapping("/editUser/{id}")
//    @RequiresPermissions("user:editUser")
    public String editUser(@PathVariable("id") int id, Model model){
        model.addAttribute("user",userService.selectUserById(id));
        return "user/userEdit";
    }

    @GetMapping("/addUser")
//    @RequiresPermissions("user:add")
    public String addUser(){
        return "user/userAdd";
    }

    @ResponseBody
    @GetMapping("/list")
//    @RequiresPermissions("user:list")
    public TableInfo userList(User user, int page, int limit) {
        List<User> list = userService.selectUserList(user,page,limit);
        List<User> users = userService.getUserCount(user);
        return tableInfo.getTableData(list,users.size());
    }

    @ResponseBody
    @PostMapping("/deleteUserById")
//    @RequiresPermissions("user:delete")
    public int deleteUserById(int userId) {
        return userService.deleteUserById(userId);
    }

    @ResponseBody
    @PostMapping("/deleteUserByIds")
//    @RequiresPermissions("user:delete")
    public int deleteUserByIds(String userId) {
        return userService.deleteUserByIds(userId);
    }


    @ResponseBody
    @PostMapping("/update")
//    @RequiresPermissions("user:update")
    public int updateUser(User user) {
        return userService.updateUser(user);
    }

    @ResponseBody
    @PostMapping("/add")
//    @RequiresPermissions("user:add")
    public int addUser(User user) {
        return userService.addUser(user);
    }

    @ResponseBody
    @PostMapping("/changeStatus")
    public int changeUserStatus(int userId){
        return userService.changeUserStatus(userId);
    }
}
