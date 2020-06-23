package net.system.usermanage.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Set;

/**
 * @author TanXY
 * @create 2020/6/1 - 21:01
 * @description
 */
@Mapper
@Repository
public interface PermissionMapper {

    public Set<String> selectUserPermsById(int UserId);
}
