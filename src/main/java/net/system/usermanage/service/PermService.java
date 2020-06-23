package net.system.usermanage.service;

import java.util.Set;

/**
 * @author TanXY
 * @create 2020/6/1 - 22:17
 * @description
 */
public interface PermService {
    public Set<String> selectUserPermsById(int userId);
}
