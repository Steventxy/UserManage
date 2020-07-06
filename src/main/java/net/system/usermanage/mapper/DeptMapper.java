package net.system.usermanage.mapper;

import net.system.usermanage.domain.Department;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author TanXY
 * @create 2020/7/6 - 8:55
 */
@Mapper
@Repository
public interface DeptMapper {
    List<Department> selectDeptList();
}
