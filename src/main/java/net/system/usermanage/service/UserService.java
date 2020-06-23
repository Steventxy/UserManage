package net.system.usermanage.service;

import net.system.usermanage.domain.User;

import java.util.List;

/**
 * @author TanXY
 * @create 2020/5/26 - 23:44
 * @description
 */
public interface UserService {

    public List<User> selectUserList(User user, int page, int pageSize);

    public User selectUserById(int userId);

    public User selectUserByName(String loginName);

    public int deleteUserByIds(String ids);

    public int deleteUserById(int id);

    public List<User> getUserCount(User user);

    public int updateUser(User user);

    public int addUser(User user);

    public int changeUserStatus(int userId);

}
