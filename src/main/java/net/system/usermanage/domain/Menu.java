package net.system.usermanage.domain;

import lombok.Data;

/**
 *
 * @author TanXY
 * @create 2020/6/7 - 10:08
 */
@Data
public class Menu {
    private int menuId;
    private String menuName;
    private int parentId;
    private String url;
    private boolean visible;
    private String perms;
    private String createBy;
    private String createTime;
    private String updateBy;
    private String updateTime;
}
