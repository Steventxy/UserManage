package net.system.usermanage.service.impl;

import net.system.usermanage.mapper.PermissionMapper;
import net.system.usermanage.service.PermService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
 * @author TanXY
 * @create 2020/6/1 - 22:18
 * @description
 */
@Service
public class PermServiceImpl implements PermService {

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public Set<String> selectUserPermsById(int userId) {
        return permissionMapper.selectUserPermsById(userId);
    }
}
