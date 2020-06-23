package net.system.usermanage.mapper;

import net.system.usermanage.domain.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author TanXY
 * @create 2020/6/7 - 10:21
 */
@Repository
@Mapper
public interface MenuMapper {
    public List<Menu> selectMenu(int userId);
}
