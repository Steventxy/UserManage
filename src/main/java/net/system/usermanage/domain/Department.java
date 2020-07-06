package net.system.usermanage.domain;

import lombok.Data;

/**
 * @author TanXY
 * @create 2020/7/6 - 8:56
 */
@Data
public class Department {
    private int deptId;

    private String deptName;

    private String leader;

    private String phone;

    private String email;

    private boolean status;
}
