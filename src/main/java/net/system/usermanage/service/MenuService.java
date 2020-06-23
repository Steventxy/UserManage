package net.system.usermanage.service;

import net.system.usermanage.domain.Menu;

import java.util.List;

/**
 * @author TanXY
 * @create 2020/6/7 - 13:55
 */
public interface MenuService {
    public List<Menu> selectMenu(int userId);
}
