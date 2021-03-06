<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bootstrap 实例 - 模态框（Modal）插件</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script>

    // update表单
    function update_info(id)
    {
        var id = id;
        //复杂一点的json的另一种形式
        var value2 = {"user_id":"123456","username":"coolcooldool"};


        // $('input[name=username]').removeAttr("readonly");//去除input元素的readonly属性
        var obj2 = eval(value2);
        // alert(obj2);

        // 赋值
        $("#user_id").val(obj2.user_id);
        $("#user_name").val(obj2.username);
        $("#act").val("edit");

        // 将input元素设置为readonly
        $('#user_id').attr("readonly","readonly")

    }

    // 添加入库操作
    function add_info()
    {

        var form_data = $("#form_data").serialize();
        alert(form_data);

    }
</script>
<body>

<h2>创建模态框（Modal）</h2>
<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
    添加
</button>
<button class="btn btn-primary btn-lg" onclick="update_info(8)" data-toggle="modal" data-target="#myModal">
    编辑
</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    模态框（Modal）标题
                </h4>
            </div>
            <form id="form_data">
                <div class="modal-body">
                    user_id: <input type="text" id="user_id" name="user_id"/>
                    name: <input type="text" id="user_name" name="user_name"/>
                    <input type="hidden" id="act" value="add" name="act"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="add_info()" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>