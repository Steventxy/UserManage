package net.system.usermanage.utils;

import com.github.pagehelper.PageInfo;
import lombok.Data;

import java.util.List;

/**
 * 用户表单返回数据
 *
 * @author TanXY
 * @create 2020/5/23 - 20:13
 */

@Data
public class TableInfo {
    //状态码
    private int code;

    //消息内容
    private String msg;

    //列表数据
    private List<?>  data;

    //总记录条数
    private long count;

    public TableInfo getTableData(List<?> list, int size){
        TableInfo resData = new TableInfo();
        resData.setCode(0);
        resData.setData(list);
        resData.setCount(new PageInfo(list).getTotal());
        return resData;
    }
}
