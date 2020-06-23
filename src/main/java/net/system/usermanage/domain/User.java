package net.system.usermanage.domain;

import lombok.Data;

/**
 * @author TanXY
 * @create 2020/5/23 - 17:18
 * @description
 */

@Data
public class User {
    private int userId;
    private String deptId;
    private String deptName;
    private String loginName;
    private String userName;
    private String password;
    private String salt;
    private String userRole;
    private String roleName;
    private String email;
    private String phone;
    private String sex;
    private boolean status;
    private String delFlag;
    private String createTime;
    private String updateTime;
    private String remark;
}
