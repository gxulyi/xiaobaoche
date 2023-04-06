<!-- jQuery 2.1.3 -->
<script src="/program/admin/plugins/jQuery/jQuery-2.1.3.min.js"></script>

<!-- Bootstrap 3.3.2 JS -->
<script src="/program/admin/js/bootstrap.min.js" type="text/javascript"></script>

<!-- InputMask -->
<script src="/program/admin/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
<script src="/program/admin/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
<script src="/program/admin/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>

<!-- FastClick -->
<script src='/program/admin/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/program/admin/dist/js/app.min.js" type="text/javascript"></script>
<!-- Sparkline -->
<script src="/program/admin/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- jvectormap -->
<script src="/program/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
<script src="/program/admin/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>

<!-- daterangepicker -->
<script src="/program/admin/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<!-- datepicker -->
<script src="/program/admin/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- iCheck -->
<script src="/program/admin/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
<!-- SlimScroll 1.3.0 -->
<script src="/program/admin/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- ChartJS 1.0.1 -->
<script src="/program/admin/plugins/chartjs/Chart.min.js" type="text/javascript"></script>

<!-- 控制台控制器 -->
<script src="/program/admin/dist/js/pages/dashboard2.js" type="text/javascript"></script>


<script type="text/javascript" src="/program/admin/jquery-easyui-1.4.4/jquery.easyui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/program/admin/jquery-easyui-1.4.4/plugins/datagrid-scrollview.js"></script>
<script type="text/javascript" src="/program/admin/jquery-easyui-1.4.4/plugins/datagrid-detailview.js"></script>
<script type="text/javascript" src="/program/admin/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

<!-- AdminLTE for demo purposes -->
<script src="/program/admin/dist/js/demo.js" type="text/javascript"></script>

<!-- DATA TABES SCRIPT -->
<script src="/program/admin/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="/program/admin/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="/program/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
<script src="/program/admin/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js" type="text/javascript"></script>

<script type="text/javascript" charset="utf-8" src="/program/admin/plugins/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/program/admin/plugins/kindeditor/lang/zh_CN.js"></script>

<script type="text/javascript" charset="utf-8" src="/program/admin/js/ajaxfileupload.js"></script>
<script type="text/javascript" charset="utf-8" src="/program/admin/js/jquery.serialize.json.js"></script>

<script>
    var gloableConfig = {
        areaConfig: {
            provice_params: {
                up_area_id: '000000000000000'
            }
        }
    };
    function decodeUserClass(c){
        var name = "普通会员";
        if(c){
            if(c == "1"){
                name = "总代理店铺会员";
            } else if(c == "2"){
                name = "厂家直销会员";
            } else if(c == "7"){
                name = "分公司";
            } else if(c == "9"){
                name = "联合商务会员";
            }
        }
        return name;
    }
    
    function ignoreNullParams(params){
       if(params == undefined || params == null){
           return {};
       }
       var targetParams = {};
       for(var name in params){
            if(params[name] && params[name].length > 0){
                 targetParams[name] = params[name]
            }
       }
       return targetParams;
    }
    
    function lock(is){
       $("body").data("__xw_worker_form_lock", (is?"true":"false"));
    }
    
    function isLock(){
       var isLock = $("body").data("__xw_worker_form_lock");
       return isLock != undefined && isLock != null && isLock == "true";
    }
    
    /**
    * 拼接下拉选择框
    * {data} 数据
    * {up_id} 上级ID
    * {tar} 目标
    */
    function render(data, up_id, tar) {
	    tar.empty();
	    tar.data("_xw_aera_filter" + up_id, data);
	    var html = "<option value=''>--请选择--</option>";
	
	    tar.append(html);
	    var isCheck = "";
	    for (var i = 0; i < data.length; i++) {
		    isCheck = "";
		    if (i == 0) {
			    isCheck = " checked";
		    }
		    html = "<option value='" + data[i].area_id + "'" + isCheck + ">"
				+ data[i].area_name + "</option>";
		    tar.append(html);
	    }

	    if (tar.val()) {
		    var nextTar = null;
		    if (tar.attr("name") == "area_provice") {
			    nextTar = $("select[name='area_city']")
		    } else if (tar.attr("name") == "area_city") {
			    nextTar = $("select[name='area_town']")
		    }
		    
		    if (nextTar) {
			    onSelectedArea(tar.val(), nextTar);
		    }
	    }
   }

   /**
   * 当选择的时候触发
   */
   function onSelectedArea(id, tar) {
	    var nextTar = null;
	    if (tar.attr("name") == "area_city") {
		    nextTar = $("select[name='area_town']")
	    } else if(tar.attr("name") == "area_provice"){
		    nextTar = $("select[name='area_city']")
	    }
	    
	    if (nextTar) {
		    nextTar.empty();
	    }
	    
	    if(!id || id == ""){
		    console.log("ID不能为空！");
		    return;
	    }
	
	    var data = tar.data("_xw_aera_filter" + id);
	    if (data) {
		    render(data, id, tar);
	    } else {
		    $.ajax({
			    url : '/runtime/services/service_area',
			    data : {
				    up_area_id : id
			    },
			    type : "post",
			    success : function(d) {
				    render(eval("(" + d + ")"), id, tar);
			    }
		    });
	    }
   }
   
   function areaInitial(){
      console.log("开始初始化区域选择组件...");
      var provice = $("select[name='area_provice']");
      if(provice && provice.length > 0){
          onSelectedArea(gloableConfig.areaConfig.provice_params.up_area_id, provice);
          var city = $("select[name='area_city']");
          if(city && city.length > 0){
              provice.on("change", function(){
                   onSelectedArea(provice.val(), city);
              });
              
              var town = $("select[name='area_town']");
              if(town && town.length > 0){
                  city.on("change", function(){
                       onSelectedArea(city.val(), town);
                  });
              }
          }
      }
   }
   
   function appInitial(){
      console.log("开始初始化应用后台...");
      areaInitial();
   }
   
   $(function(){
       appInitial();
   })
</script>