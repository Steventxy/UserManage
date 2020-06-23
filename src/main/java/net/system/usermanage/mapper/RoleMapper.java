package net.system.usermanage.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @author TanXY
 * @create 2020/6/1 - 15:06
 * @description
 */
@Mapper
@Repository
public interface RoleMapper {

    public String selectUserRoleById(int userId);
}
