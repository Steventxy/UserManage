package net.system.usermanage.service;

import net.system.usermanage.domain.Department;

import java.util.List;

/**
 * @author TanXY
 * @create 2020/7/6 - 8:55
 */
public interface DeptService {
    List<Department> selectDeptList();
}
