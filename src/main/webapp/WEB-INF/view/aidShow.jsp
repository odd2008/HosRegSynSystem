<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>协和医院欢迎您</title>
        <meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css" media="all">
		<script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    	<link rel="Shortcut Icon" href="http://oa.whuh.com/static/images/trasen.ico">
    </head>
    <body>

<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">查看全文</a>
</script>
<script>
layui.use('table', function(){
  var table = layui.table;
  table.render({
    elem: '#test'
    ,url:'${pageContext.request.contextPath}/care/aidContent.do'
    ,toolbar: '#toolbarDemo'
    ,title: '用户数据表'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'aid', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
      ,{field:'adesc', title:'状况描述', width:100}
      ,{field:'acontent', title:'急救措施', width:700}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:100}
    ]]
    ,page: true
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'getCheckData':
        var data = checkStatus.data;
        layer.alert(JSON.stringify(data));
      break;
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
      break;
      case 'isAll':
        layer.msg(checkStatus.isAll ? '全选': '未全选');
      break;
    };
  });
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
  	var data = obj.data;
    if(obj.event === 'del'){} 
    else if(obj.event === 'edit'){
      layui.use('layer', function(){
  		 var layer = layui.layer;
		 //8s后自动关闭
  		 layer.msg(data.acontent, {
	         time: 8000, btn: ['好的']
	     });
	  }); 
    }
  });
});
</script>
    </body>
</html>