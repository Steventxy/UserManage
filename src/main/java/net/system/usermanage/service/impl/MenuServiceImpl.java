package net.system.usermanage.service.impl;

import net.system.usermanage.domain.Menu;
import net.system.usermanage.mapper.MenuMapper;
import net.system.usermanage.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author TanXY
 * @create 2020/6/7 - 16:04
 */
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    MenuMapper menuMapper;

    @Override
    public List<Menu> selectMenu(int userId) {
        return menuMapper.selectMenu(userId);
    }
}
