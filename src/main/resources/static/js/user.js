layui.use('table', function () {
    var $ = layui.jquery,
        table = layui.table,
        tableObj = table.render({}),
        form = layui.form,
        laydate = layui.laydate;

    table.render({
        elem: '#userList',
        id: 'userList',
        url: '/user/list', //数据接口
        toolbar: "#toolbar",
        limit: 10,
        initSort: {
            field: 'userId',
            type: 'asc'
        },
        page: {
            // layout: ['prev', 'page', 'next','count', 'limit', 'refresh', 'skip'],
            limits: [5, 10, 15, 20]
        },
        where: {
            userName: '',
            sex: ''
        },
        cols: [[//表头
            {
                checkbox: true,
                fixed: 'left'
            },
            {
                field: 'userId',
                title: 'ID',
                width: 50
            },
            {
                field: 'loginName',
                title: '登录名称',
                width: 120
            },
            {
                field: 'userName',
                title: '用户名称',
                width: 120,
            },
            {
                field: 'sex',
                title: '性别',
                width: 65
            },
            {
                field: 'roleName',
                title: '用户角色',
                width: 120,
                sort: true
            },
            {
                field: 'deptName',
                title: '部门',
                width: 70
            },
            {
                field: 'phone',
                title: '电话',
                minWidth: 120
            },
            {
                field: 'email',
                title: '邮箱',
                minWidth: 205
            },
            {
                field: 'status',
                title: '用户状态',
                width: 95,
                templet: '#switchTpl'
                // toolbar: '#status-switch'
            },
            {
                field: 'createTime',
                title: '创建时间'
            },
            {
                field: 'updateTime',
                title: '修改时间'
            },
            {
                title: '操作',
                fixed: 'right',
                align: 'center',
                toolbar: '#tools'
            }
        ]]
    });
    //头工具栏事件
    table.on('toolbar(userList)', function (obj) {
        var checkStatus = table.checkStatus('userList'),
            layer = parent.layer === undefined ? layui.layer : top.layer;
        switch (obj.event) {
            case 'delete':
                var data = checkStatus.data;
                if (data.length > 0) {
                    layer.confirm('确认要删除吗？', function (index) {
                        var userIds = "";
                        for (var i = 0; i < data.length; i++) {
                            userIds += data[i].userId;
                            if (i !== data.length - 1)
                                userIds += ',';
                        }
                        $.ajax({
                            type: "post",
                            url: "/user/deleteUserByIds",
                            dataType: 'json',
                            // async: false,
                            data: "userId=" + userIds,
                            success: function (data) {
                                console.log(data);
                                if (data !== 0) {
                                    layer.close(index);
                                    layer.alert("删除成功", {icon: 6});
                                    table.reload('userList');
                                } else {
                                    layer.alert("删除失败", {icon: 2, title: '提示'});
                                }
                            },
                            error: function () {
                                layer.alert("删除失败", {icon: 2, title: '提示'});
                            }
                        });
                    });
                } else {
                    layer.alert('请选择一条数据', {icon: 7, title: '警告'});
                }

                break;
            case 'add':
                layer.open({
                    type: 2,
                    title: '添加用户',
                    shadeClose: false,
                    shade: 0.8,
                    area: ['40%', '70%'],
                    anim: 0,
                    content: '/user/addUser/'
                });
                break;
        }
    });
//监听每行的工具条
    table.on('tool(userList)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data, //获得当前行数据
            layEvent = obj.event, //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            tr = obj.tr, //获得当前行 tr 的 DOM 对象（如果有的话）
            editList = [],
            layer = parent.layer === undefined ? layui.layer : top.layer;

        // console.log(obj);
        if (layEvent === 'detail') { //查看
            //do something
        } else if (layEvent === 'delete') { //删除
            layer.confirm('确认要删除吗？', function (index) {
                //向服务端发送删除指令
                $.ajax({
                    type: "post",
                    url: "/user/deleteUserById",
                    dataType: 'json',
                    // async: false,
                    data: "userId=" + data.userId,
                    success: function (data) {
                        // console.log(data);
                        if (data === 1) {
                            obj.del();
                            layer.close(index);
                            layer.alert("删除成功", {icon: 1, time: 2000});
                        } else {
                            layer.alert("删除失败", {
                                icon: 2,
                                title: '提示'
                            });

                        }
                    },
                    error: function () {
                        layer.alert("删除失败", {
                            icon: 2, title: '提示'
                        });
                    }

                });
            });

        } else if (layEvent === 'edit') { //编辑
            layer.open({
                type: 2,
                title: '修改用户信息',
                shadeClose: false,
                shade: 0.8,
                area: ['40%', '70%'],
                anim: 0,
                content: '/user/editUser/' + data.userId,
                //     success: function (data) {
                //         console.log(data);
                //         if (data !== 0) {
                //             layer.close(layer.index);
                //             layer.alert("修改成功", {icon: 6});
                //             table.reload('userList');
                //         } else {
                //             layer.alert("修改失败", {icon: 2, title: '提示'});
                //         }
                //     },
                //     error: function () {
                //         layer.alert("修改出错", {icon: 2, title: '提示'});
                //     }
            });
        }
    });
    /*监听搜索按钮*/
    form.on('submit(searchBtn)', function (data) {
        table.reload('userList', {
            url: '/user/list',
            where: {
                userName: data.field.userName,
                sex: data.field.sex,
                deptId: data.field.deptId,
                createTime: data.field.createTime
            },
            curr: 1
        });
        return false;
    });
    /*监听重置按钮*/
    form.on('submit(clearBtn)', function (data) {
        table.reload('userList', {
            url: '/user/list',
            where: {
                userName: '',
                sex: '',
                deptId: '',
                createTime: ''
            },
            page: {
                curr: 1
            }
        });
    });
    /*监听表单中开关*/
    form.on('switch(status)', function (data) {
        var index = layer.msg('修改中，请稍候', {icon: 16, time: false, shade: 0.8});
        $.ajax({
            type: "post",
            url: "/user/changeStatus",
            dataType: 'json',
            // async: false,
            data: "userId=" + data.value,
            success: function (data) {
            },
            error: function () {
                layer.alert("操作失败", {
                    icon: 2, title: '提示'
                });
            }
        });
        setTimeout(function () {
            layer.close(index);
            if (data.elem.checked) {
                layer.msg("用户已启用！");
            } else {
                layer.msg("用户已停用！");
            }
        }, 200);
    });
});
/*头部日期组件*/
layui.use('laydate', function () {
    var laydate = layui.laydate;

    //执行一个laydate实例
    laydate.render({
        elem: '#createTime', //指定元素
        format: 'yyyy-MM-dd' //可任意组合
    });
});

