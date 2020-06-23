package net.system.usermanage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 以今天用户管理为例，结合前面练习诺依项目代码及用户数据表tb_user，
 * 结合js,css,div,在spring boot基础上实现用户分页显示，多记录选择，实现多记录批量删除功能，
 * 项目为UserMange,包为com.hunau,完成后将源代码与操作视频发给我，
 * 注意页面一定要利用js,css进行美化。
 *
 * 今天作业：结合上次作业与诺依程序，完成用户列表显示分页功能与下拉列表展示不同字段查询功能，
 * 并实现用户增删修改功能，注意增加与修改要根据字段情况，有的需利用枚举、日期等实现，不能都是文本框，
 * 注意js,images,css的正确使用。本周完成有效。
 *
 * 今天实验作业：结合今天视频用户权限管理，参照诺依代码，实现用户-角色-功能-资源操作，
 * 从诺依代码中提取用户权限管理功能，要求项目名UserMange+学号后三位，包名net.hunau.
 * 下周上课前提交有效，另外会布置提问，请查看自己QQ
 *
 * 本周实验：根据本次视频学习，结合诺依系统，完成数据库表sys_menu的增删改查功能，
 * 并完整实现系统菜单树功能，以及富文本编辑功能。其中项目名为menutree+学号最后三位，
 * 包前缀为net.system,本周提交有效，注意单独发的测试题。
 */
@SpringBootApplication
public class UserManageApplication {

    public static void main(String[] args) {
        SpringApplication.run(UserManageApplication.class, args);
    }


}
