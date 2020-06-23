package net.system.usermanage.service.impl;

import net.system.usermanage.mapper.RoleMapper;
import net.system.usermanage.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author TanXY
 * @create 2020/6/1 - 22:00
 * @description
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Override
    public String selectUserRoleById(int userId) {
        return roleMapper.selectUserRoleById(userId);
    }
}
