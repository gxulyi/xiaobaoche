<!DOCTYPE html>
<html class='default' dir='ltr'>
<head>
<#include "header.ftl"/>
<#assign title ='象网新闻'>
<#if requestParams.type == '1'>
<#assign title ='象网新闻'>
<#elseif requestParams.type == '2'>
<#assign title ='行业动态'>
<#elseif requestParams.type == '3'>
<#assign title ='修车养车'>
</#if>
</head>

<body class="skin-blue">
    <div class="wrapper">
      <#include "a-header.ftl"/>
      <#include "left-aside.ftl"/>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>新闻资讯管理
            <small>版本  ${admin_version}</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">新闻资讯管理</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
             <div class="col-md-12">
                <div class="box box-success">
                    	<div class="box-header">
                            <h3 class="box-title"> ${title}</h3>
                                <form id="news_form">
                                    <div class="form-group" style="margin-top: 10px;margin-bottom: 0;">
                                   <div class="row">
                                      <div class="col-md-3">
                                           <div class="input-group">
                                           		<span class="input-group-addon">标题</span>
                                                <input type="text" name="title" class="form-control" placeholder="请输入关键词 " />
                                           </div>
                                      </div>
                                      <div class="col-md-3">
                                           <div class="input-group">
                                           		<span class="input-group-addon">发布状态</span>
                                                <input type="text" name="state" class="form-control" placeholder="输入1(已发布)或0(未发布) " />
                                           </div>
                                      </div>
                                      <div class="col-md-3">
                                           <div class="input-group">
                                           		<span class="input-group-addon">发布时间</span>
                                                <input type="text" name="in_date" class="form-control" placeholder="请输入时间 " />
                                           </div>
                                      </div>
                                      <div class="col-md-3">
                                           <a class="btn btn-success" href="javascript:search();">搜索</a>
                                      </div>
                                  </div>
                               </div>
                                </form>
                        </div>
                        
                        <div class="box-body" style="min-height: 650px;">
                            <table id="data-table" class="table table-bordered" style="height: 650px;">
                            </table>
                        </div>
                        <div class="box-footer">
                            
                        </div>
                </div>
             </div>
          </div>
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <#include "p-footer.ftl"/>

    </div><!-- ./wrapper -->
    <#include "footer.ftl"/>
    <script type="text/javascript">
      $(function () {
          $('#data-table').datagrid({
                url:"/runtime/datas/data_query_news?type=${requestParams.type}",
                pagination: true,
                singleSelect: false,
                rownumbers:true,
                pageSize: 20,
                loadMsg: "加载中，请稍后...",
	            columns:[[
	                {field:'ck', align:'left', checkbox: true},
		            {field:'title',title:'标题', width:280, align:'left'},
		            {field:'type',title:'类型', width:100, align:'center',
		             formatter: function(value,row,index){
		                 var name = "象网新闻";
		                 if(value){
		                 if(value=='1'){
		                     name = "象网新闻";
		                 } else if(value=='2'){
		                    name = "行业动态";
		                 }else if(value=='3'){
		                    name = "修车养车";
		                 }
		                 }
		                 return name;
			       }},
		            {field:'in_date',title:'时间', width:120, align:'center'},
		            {field:'state',title:'状态', width:80,align:'center',
		            formatter: function(value,row,index){
		                 var btn = "";
		                 if(value=='1'){
		                     btn = '<span class="badge bg-green"><i class="fa fa-check"></i>已发布</span>';
		                 } else if(value=='0'){
		                     btn = '<span class="badge bg-red"><i class="fa fa-times-circle-o"></i>未发布</span>';
		                 }
		                 return btn;
			       }},
		            {field:'oper',title:'操作', width:100,align:'center',
		            formatter: function(value,row,index){
		                 var btn = '<a class="btn" target="_blank" href="/program/admin/news_modify?id=' + row.news_id + '"><i class="fa fa-edit"></i></a>';
		                 btn = btn + '<a class="btn" target="_blank" href="/program/admin/news_detail?id=' + row.news_id + '"><i class="fa fa-search-plus"></i></a>';
		                 return btn;
			       }}
	            ]],
	            toolbar: [{
		           iconCls: 'fa fa-check',
		           text: '发布',
		           handler: function(){
		               update({state: '1'});
		           }
	            },'-',{
		           iconCls: 'fa fa-minus',
		           text: '取消发布',
		           handler: function(){
		               update({state: '0'});
		           }
	            },'-',{
		           iconCls: 'fa fa-plus',
		           text: '添加',
		           handler: function(){
		               window.location.href="/program/admin/news_add";
		           }
	            },'-',{
		           iconCls: 'fa fa-minus',
		           text: '删除',
		           handler: function(){
		               del();
		           }
	            }],
	           
          });
      });
      
      /**/
      function update(params){
          var rows = $('#data-table').datagrid("getChecked");
          if(rows){
              var askParams = params;
              var ids = "";
              for(var i = 0; i < rows.length; i++){
                  if(i == 0){
                      ids = rows[i].news_id;
                  } else {
                      ids = ids + "," +  rows[i].news_id;
                  }
              }
              
              askParams.ids = ids;
              $('#data-table').datagrid("loading");
              $.ajax({
                  url: "/runtime/services/service_public_news",
                  data: askParams,
                  type: 'post',
                  success: function(data){
                      $('#data-table').datagrid("reload");
                      onResponse(data);
                  },
                  error: function(){
                      $('#data-table').datagrid("reload");
                  }
              });
          }
      }
      
      function search(){
          var params = $("#news_form").serializeJson();
          var targetParams = {};
          for(var name in params){
             if(params[name] && params[name].length > 0){
                 targetParams[name] = params[name]
             }
          }
          $('#data-table').datagrid("load", targetParams);
      }
      
      function onResponse(json){
          var gson = eval("(" + json + ")");
          if(gson.code == 0){
              $('#data-table').datagrid("reload");
          } else {
              alert(gson.msg);
          }
      }
      
      function del(){
           var ids =""
           var params = {}
           var rows = $('#data-table').datagrid("getChecked")
           if(rows && rows.length > 0){
           		for(var i =0 ;i<rows.length ;i++){
           			ids += rows[i].news_id + ","
           		}
           }
           if(ids == ""){
           		alert("请选择将要删除数据")
           		return
           }else{
           		params.ids = ids
           		$.messager.confirm("确认删除" ,"删除数据后，数据将无法恢复！" , function(r){
           			if(r){
           				$.ajax({
           					url: "/runtime/services/service_delete_news",
           					type: "post",
                    		data: params,
                    		success: function(data){
                       			onLoaded();
                        		console.log(data)
                        		if(data.errorMsg){
                            		alert(gson.errorMsg)
                        		} else {
                            		alert("删除成功")
                            		$('#data-table').datagrid("reload")
                       			}
                    		},
                    		error: function(){
                        		alert("提交失败！");
                        		onLoaded();
                   			}
           				})
           			}
           		})
           }
            	
       }
      
      function onLoading(){
         $(".overlay").show();
      }
        
      function onLoaded(){
         $(".overlay").hide();
      }
      
      function onError(error){
          
      }
    </script>
</body>

</html>