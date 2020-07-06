package net.system.usermanage.service.impl;

import net.system.usermanage.domain.Department;
import net.system.usermanage.mapper.DeptMapper;
import net.system.usermanage.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author TanXY
 * @create 2020/7/6 - 8:56
 */
@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    DeptMapper deptMapper;

    @Override
    public List<Department> selectDeptList() {
        return deptMapper.selectDeptList();
    }
}
