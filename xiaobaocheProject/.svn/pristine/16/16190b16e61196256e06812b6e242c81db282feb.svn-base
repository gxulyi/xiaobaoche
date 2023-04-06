<!DOCTYPE html>
<html class='default' dir='ltr'>
<head>
<#include "header.ftl"/>
     <link rel="stylesheet" type="text/css" href="${tpl}plugins/kindeditor/themes/qq/qq.css" />
</head>

<body class="skin-blue">
    <div class="wrapper">
      <#include "a-header.ftl"/>
      <#include "left-aside.ftl"/>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>帮助信息
            <small>版本  ${admin_version}</small>
          </h1> 
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">帮助信息</li>
          </ol>
        </section>
        
        <!-- Main content -->
        <section class="content">

            <div class="callout callout-warning">
                 <h4>帮助信息说明</h4>
                 <p>主站宽度为1190px，主字体为“微软雅黑”。</p>
            </div>
            <form class="row" id="about-info-form">
                  <input type="hidden" name="info_id" value="" class="form-control"/>
                  <div class="col-md-12">
                       <div class="box box-primary">
                            <div class="box-header">
                                 <h3 class="box-title">帮助信息</h3>
                            </div><!-- /.box-header -->
                            <div class="box-body">
                                 <div class="form-group">
                                      <div class="input-group">
                                           <span class="input-group-addon">文章ID</span>
                                           <input type="text" value="" class="form-control" disabled />
                                      </div>
                                 </div>
                                 <div class="form-group">
                                      <div class="input-group">
                                           <span class="input-group-addon">文章标题</span>
                                           <input type="text" name="title" value="" class="form-control" placeholder="标题" />
                                      </div>
                                 </div>
                                 <div class="form-group">
                                      <div class="input-group">
                                           <span class="input-group-addon">修改日期</span>
                                           <input type="text" disabled value="" class="form-control" />
                                      </div>
                                 </div>
                                 <div class="form-group">
                                      <input type="checkbox" name="state" class="minimal-red"<#if abount_info.state?exists><#if abount_info.state == "1"> checked</#if></#if>/>
                                      <label>是否上线</label>
                                 </div>
                                 <div class="form-group">
                                      <textarea rows="12" class="form-control" name="content" id="html-content"></textarea>
                                 </div>
                            </div><!-- /.box-body -->
                            <div class="box-footer">
                                 <div class="pull-right">
                                      <a href="javascript:save();"  class="btn btn-primary"><i class="fa fa-envelope-o"></i> 确认</a>
                                 </div>
                                 <a href="javascript:deleteHelp();" class="btn btn-default" <#if abount_info.info_id?exists><#else>disabled</#if>><i class="fa fa-times"></i> 删除</a>
                            </div>
                            <div class="overlay">
                                 <i class="fa fa-refresh fa-spin"></i>
                            </div><!-- /.overlay -->
                       </div><!-- /.box-primary -->
                  </div><!-- /.col-md-12 -->
            </form><!-- /#about-info-form -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <#include "p-footer.ftl"/>

    </div><!-- ./wrapper -->
    <#include "footer.ftl"/>
    
    <script type="text/javascript" charset="utf-8">
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
            
            $("#activity-form").find("select[name='catagory_u']").on("change", function(){
                onUpCatChange($(this).val());
            });
            
            onLoaded();
        });
        
        function save(){
            if(!checkLoading()){
                $.messager.show({title: '帮助文档', msg: '请不要频繁进行操作！', timeout: 5000, showType: 'slide'});
                return;
            }
            var form = $("#about-info-form").serializeJson();
            var params = {};
            for(var name in form){
                if(form[name] != undefined && form[name] != null && form[name] != ""){
                     params[name] = form[name];
                }
            }
            var ck = $("#about-info-form").find("input[name='state']")[0];
            if(!params.title){
                $.messager.alert('帮助文档', '请填写帮助文档标题！');
                return;
            }
            params.state = ck.checked? '1': '0';
            params.content = editor.html();
            
            onLoading();
            $.ajax({
                url: "/runtime/services/service_add_help",
                type: "post",
                data: params,
                success: function(data){
                    onLoaded();
                    var gson = eval("(" + data + ")");
                    if(gson.errorMsg){
                         $.messager.show({title: '帮助文档', msg: gson.errorMsg, timeout: 5000, showType: 'slide'});
                    } else {
                         $.messager.confirm('帮助文档', '添加成功，是否新增？', function(r){
                              if(r){
                                   window.location.href = "/program/admin/m_help";
                              } else {
                                   window.location.href = "/program/admin/m_help?id=" + gson.id;
                              }
                         });
                    }
                },
                error: function(){
                    onLoaded();
                }
            });
        }
        
        function onLoading(){
            $("body").data("_dworker_form_loading", "true");
            $(".overlay").show();
        }
        
        function onLoaded(){
            $("body").data("_dworker_form_loading", "false");
            $(".overlay").hide();
        }
        
        function checkLoading(){
            var ckLoading = $("body").data("_dworker_form_loading");
            if(ckLoading == "true"){
                return false;
            }
            return true;
        }
        
        function deleteHelp(){
            console.log("执行删除操作！");
            if(!checkLoading()){
                $.messager.show({title: '帮助文档', msg: '请不要频繁进行操作！', timeout: 5000, showType: 'slide'});
                return;
            }
            var info_id = $("#about-info-form").find("input[name='info_id']").val();
            if(info_id && info_id != "" && info_id != "undefined"){
                onLoading();
                $.ajax({
                     url: "/runtime/services/service_delete_about",
                     type: "post",
                     data: {"info_id": info_id},
                     success: function(data){
                         onLoaded();
                         var gson = eval("(" + data + ")");
                         if(gson.errorMsg){
                             $.messager.show({title: '帮助文档', msg: gson.errorMsg, timeout: 5000, showType: 'slide'});
                         } else {
                             $.messager.confirm('帮助文档', '删除成功，是否新增？', function(r){
                                  if(r){
                                      window.location.href = "/program/admin/m_help";
                                  }
                             });
                         }
                     },
                     error: function(){
                         onLoaded();
                     }
                })
            }
        }
    </script>
</body>

</html>