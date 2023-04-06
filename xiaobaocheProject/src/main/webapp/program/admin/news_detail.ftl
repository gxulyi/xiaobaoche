<!DOCTYPE html>
<html class='default' dir='ltr'>
<head>
<#include "header.ftl"/>
</head>

<body class="skin-blue">
    <div class="wrapper">
      <#include "a-header.ftl"/>
      <#include "left-aside.ftl"/>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>资讯详情
            <small>版本  ${admin_version}</small>
          </h1> 
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">详情</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
             <div class="col-md-12">
             
                            <div class="callout callout-warning">
                               <h4>资讯录入说明</h4>
                               <p>图片封面大小比例为320X280，请控制在200KB以内</p>
                            </div>
                <div class="box box-primary">
                    	<div class="box-header">
                            <h3 class="box-title">资讯详情</h3>
                        </div>
                        <div class="box-body">
                            <form id="activity-form">
                              <input type="hidden" name="news_id" value= "${detail_news.news_id!""}"  /> 
                              
                               <div class="form-group">
                                  <div class="row">
                                      <div class="col-md-4">
                                           <div class="input-group">
                                                <span class="input-group-addon">标题</span>
                                                <input type="text" name="title" value="${detail_news.title!""}" class="form-control" disabled />
                                           </div>
                                      </div>
                                      <div class="col-md-3">
                                           <div class="input-group">
                                                <span class="input-group-addon">类型</span>
						                       	<select name="type" value="${detail_news.type!""}" style="border:1px solid #ccc;width:180px;height:34px;line-height:34px;" >
						                       		<#if detail_news.type == "1">
						                       		<option value="1">象网新闻</option>
						                       		<#elseif detail_news.type == "2">
						                       		<option value="2">行业动态</option>
						                       		<#elseif detail_news.type == "3">
						                       		<option value="3">修车养车</option>
						                       		</#if>
						                       	</select>
                                      </div>
                                     </div>
                                      <div class="col-md-3">
                                           <div class="input-group ">
                                                <span class="input-group-addon ">时间</span>
                                               <input class="form-control" name="in_date" value="${detail_news.in_date!""}" style="height:34px;" disabled>
                                          
                                           </div>
                                      </div>
                                      <div class="col-md-2">
                                           <label>
                                           <input type="checkbox" name="state" value="${detail_news.state!""}" class="minimal-red"<#if detail_news.state?exists><#if detail_news.state == "1"> checked</#if></#if>/>
                                           </label>
                                           <label>是否发布</label>
                                          
                                      </div>
                                  </div>
                               </div>
                               <div class="form-group">
                                  <div class="row">
                                      <div class="col-md-3">
                                           <label>图片</label>
                                           <img id="real_upload_file" class="thumbnail" src="<#if detail_news.file_path?exists>${detail_news.file_path}<#else><#if attach_news?exists>${attach_news.file_path?if_exists}</#if></#if>" style="width: 200px; height: 200px;"/>
                                           <br />
                                           <div class="form-group">
                                           <div class="btn btn-default btn-file">
                                               <i class="fa fa-paperclip"></i> 资讯简图
                                               <input id="up_load_file" type="file" name="attachment"/>
                                           </div>
                                           <p class="help-block">最大图片限制：200KB</p>
                                           </div>
                                      </div>
                                      <div class="col-md-9">
                                           <div class="row">
                                               <div class="col-md-12">
                                               <div class="form-group">
                                                    <label>详细说明</label>
                                                    <textarea id="html-content" name="content" class="form-control" rows="20" placeholder="请输入 ...">${detail_news.content!""}</textarea>
                                               </div>
                                               </div>
                                           </div>
                                      </div>
                                  </div>
                               </div>
                            </form>
                        </div>
                       
                        <div id="form-overlay-loading" class="overlay">
                             <i class="fa fa-refresh fa-spin"></i>
                        </div>
                </div>
             </div>
          </div>
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <#include "p-footer.ftl"/>

    </div><!-- ./wrapper -->
    <#include "footer.ftl"/>
    <script>
    	var editor = null;
     	KindEditor.ready(function(K) {
           editor = K.create('#html-content',{items: ['source', '|', 'undo', 'redo', '|', 'preview', 'print'
            , 'cut', 'copy', 'paste', '|', 'justifyleft', 'justifycenter', 'justifyright',
            'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
            'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
            'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
            'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
            'table', 'hr', 'emoticons', 'pagebreak',
            'anchor', 'link', 'unlink'],uploadJson:"/runtime/services/service_upload_image"});
     	});
    
       $(function(){
            document.getElementById("up_load_file").addEventListener('change',readFile,false);
            $("#form-overlay-loading").hide();
            //iCheck for checkbox and radio inputs
            $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                 checkboxClass: 'icheckbox_minimal-blue',
                 radioClass: 'iradio_minimal-blue'
            });
            //Red color scheme for iCheck
            $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                checkboxClass: 'icheckbox_minimal-red',
                radioClass: 'iradio_minimal-red'
            });
            //Flat red color scheme for iCheck
            $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
            });
            
             $("#activity-form").find("select[name='title']").on("change", function(){
                onUpNewsChange($(this).val());
            });
        });
        
        function readFile(){ 
             var file = this.files[0]; 
             if(!/image\/\w+/.test(file.type)){ 
                 alert("文件必须为图片！"); 
                 return false; 
             } 
             var reader = new FileReader(); 
             reader.readAsDataURL(file); 
             reader.onload = function(e){ 
                 $("#real_upload_file").attr("src", this.result);
             };
       }
       
    function onUpNewsChange(id){
           var sItems = $("#activity-form").find("select[name='title']").empty();
           var datas = sItems.data("sub-news-" + id);
           var render = function(datas){
               var html = "";
               for(var i = 0; i < datas.length; i++){
                   html = html + "<option value='" + datas[i].news_id + "'>" + datas[i].title+ "</option>";
               }
               sItems.append(html);
           }
           if(datas){
              render(datas);
           } else {
              $.ajax({
                 url: "/runtime/datas/data_query_news",
                 type: "post",
                 data: {isSelect: "true", news_id: id},
                 success: function(data){
                     var gson = eval("(" + data + ")");
                     sItems.data("sub-news-" + id, gson);
                     render(gson);
                 }
              });
           }
       }
     
       
       function onUpdate(json){
           $("#activity-form").find("input[name='news_id']").val(json.id);
           if(json.errorMsg){
              alert(json.errorMsg);
              $("#form-overlay-loading").hide();
           } else {
              uploadImage();
           }
       }
       
       function uploadImage(){
           var dat = {attach_root_id: $("#activity-form").find("input[name='news_id']").val(), file_type: "0", "attach_module": "biz"};
           $.ajaxFileUpload({
			   url: '/runtime/services/service_upload',
			   secureuri :false,
			   data: dat, //此参数非常严谨，写错一个引号都不行
			   fileElementId :'up_load_file',//file控件id
			   success : function (data, status){
                    alert("更新成功啦！");
                    $("#form-overlay-loading").hide();
			   },
			   error: function(data, status, e){
				    alert(status);
                    $("#form-overlay-loading").hide();
			   }
		   });
       }
    </script>
</body>

</html>