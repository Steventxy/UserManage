package net.system.usermanage.mapper;

import net.system.usermanage.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author TanXY
 * @create 2020/5/23 - 17:19
 * @description
 */
@Mapper
@Repository
public interface UserMapper {
    public List<User> selectUserList(User user, int start, int pageSize);

    public List<User> getUserCount(User user);

    public User selectUserById(int userId);

    public User selectUserByName(String loginName);

    public int deleteUserByIds(Integer[] ids);

    public int deleteUserById(int id);

    public int updateUser(User user);

    public int addUser(User user);

    public int changeUserStatus(int userId,int status);

}
