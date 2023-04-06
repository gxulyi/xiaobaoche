<!DOCTYPE html>
<html class='default' dir='ltr'>
<head>
<#include "header.ftl"/>
</head>
<style>
.form-group.one {margin-left:15px;}
#html-content ,#html-content2 {width:100%}
.box-success.account ,.box-success.custom {height:640px;}
.box-success.company {height:800px;}
.box-footer {position:absolute;bottom:0;left:0 ;right:0;}
.box-footer {position:absolute;bottom:0;left:0 ;right:0;}
</style>
<body class="skin-blue">
    <div class="wrapper">
      <#include "a-header.ftl"/>
      <#include "left-aside.ftl"/>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>个人信息管理维护
            <small>版本  ${admin_version}</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">个人信息管理维护</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-6">
                <#include "mem_account.ftl" />
                </div>
                <div class="col-md-6">
                <#include "mem_custom.ftl" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                <#include "mem_company.ftl" />
                </div>
            </div>
            
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <#include "p-footer.ftl"/>

    </div><!-- ./wrapper -->
    <#include "footer.ftl"/>
    <script>
       $(function(){
       		$("input").attr("disabled" ,true)
            $(".overlay").hide();
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
		})
		
		var editor = null ,editor2 = null
     	KindEditor.ready(function(K) {
          	 	editor = K.create('#html-content',{items: ['source', '|', 'undo', 'redo', '|', 'preview', 'print'
         	  	 , 'cut', 'copy', 'paste', '|', 'justifyleft', 'justifycenter', 'justifyright',
          	  	'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
          	  	'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
           		'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
           		'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
           		'table', 'hr', 'emoticons', 'pagebreak',
           	 	'anchor', 'link', 'unlink'], uploadJson:"/runtime/services/service_upload_image"});
           	 	
           	 	editor2 = K.create('#html-content2',{items: ['source', '|', 'undo', 'redo', '|', 'preview', 'print'
         	  	 , 'cut', 'copy', 'paste', '|', 'justifyleft', 'justifycenter', 'justifyright',
          	  	'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
          	  	'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
           		'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
           		'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
           		'table', 'hr', 'emoticons', 'pagebreak',
           	 	'anchor', 'link', 'unlink'], uploadJson:"/runtime/services/service_upload_image"});
           	 	
           	 	editor.readonly(true)
           	 	editor2.readonly(true)
     	})
	
		function unlockAccount(id){
			$("#"+id).find(".editable").attr("disabled" ,false)
			if(id=="mem-company-form"){
           		editor.readonly(false)
            	editor2.readonly(false)
			}
			alert("解锁成功")
		}
		
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
       
	   function save(id){
			editor.sync()
			editor2.sync()
			var form = $("#"+id)
			var url = form.attr("action")
			var params = $(form).serializeJson() 
			$.ajax({
				url: url,
				context:id,
				type: "post",
				data: params,
				success:function(data){
					var _data = eval("("+data+")")
					if(_data.errorMsg){
						alert(_data.errorMsg)
					}else{
						if(this == "mem-account-form"){
							onUpdate(_data);
							
           var dat = {attach_root_id: "", file_type: "0", "attach_module": "user"};
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
						}else{
							alert("更新成功！")
							location.reload()
						}
					}
				},
				error: function(data, status, e){
				    alert(status);
			   }
			})
		}
		
		function onUpdate(json){
           $("#mem-account-form").find("input[name='biz_id']").val(json.id);
           if(json.errorMsg){
              alert(json.errorMsg);
              $("#form-overlay-loading").hide();
           } else {
              uploadImage();
           }
       }
       
       function uploadImage(){
           var dat = {attach_root_id: $("#mem-account-form").find("input[name='user_id']").val(), file_type: "0", "attach_module": "user"};
           $.ajaxFileUpload({
			   url: '/runtime/services/service_upload',
			   secureuri :false,
			   data: dat, 
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