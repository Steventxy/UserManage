package net.system.usermanage.service.impl;

import net.system.usermanage.domain.User;
import net.system.usermanage.mapper.UserMapper;
import net.system.usermanage.service.UserService;
import net.system.usermanage.utils.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author TanXY
 * @create 2020/5/23 - 17:19
 * @description
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> getUserCount(User user){
        return userMapper.getUserCount(user);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int changeUserStatus(int userId) {
        User user = userMapper.selectUserById(userId);
        boolean s = !user.isStatus();
        System.out.println(s);
        int status;
        if (s)
            status = 1;
        else
            status = 0;
        return userMapper.changeUserStatus(userId,status);
    }

    @Override
    public User selectUserById(int userId){
        return userMapper.selectUserById(userId);
    }

    @Override
    public User selectUserByName(String loginName) {
        return userMapper.selectUserByName(loginName);
    }

    @Override
    public int deleteUserByIds(String ids) {
        Integer[] userIds = Convert.toIntArray(",",ids);
        return userMapper.deleteUserByIds(userIds);
    }

    @Override
    public int deleteUserById(int id) {
        return userMapper.deleteUserById(id);
    }


    @Override
    public List<User> selectUserList(User user, int page, int pageSize) {
        int start = (page - 1) * pageSize;
        return userMapper.selectUserList(user,start,pageSize);
    }
}