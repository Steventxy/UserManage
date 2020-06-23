package net.system.usermanage.domain;

import lombok.Data;

/**
 *
 * @author TanXY
 * @create 2020/6/1 - 14:04
 */
@Data
public class Role {
    private String roleId;
    private String permId;
    private String roleName;
    private String roleKey;
    private boolean status;
    private String delFlag;
}
