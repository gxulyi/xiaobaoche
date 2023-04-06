$(function() {
	onLoading();
	$("#mem-info-tb")
			.datagrid(
					{
						url : "/runtime/services/service_un_mem_query",
						pagination : true,
						singleSelect : false,
						rownumbers : true,
						pageSize : 20,
						loadMsg : "加载中，请稍后..."/*,
						toolbar : [ {
							iconCls : 'icon-ok',
							text : '批量审核',
							handler : function() {
								addVip();
							}
						} ]*/,
						columns : [ [
								{
									field : 'ck',
									align : 'left',
									checkbox : true
								},
								{
									field : 'cust_name',
									title : '会员名称',
									width : 180,
									align : 'left'
								},
								{
									field : 'reg_date',
									title : '注册日期',
									width : 120,
									align : 'left'
								},
								{
									field : 'user_class',
									title : '会员类型',
									width : 90,
									formatter : function(value, row, index) {
										var name = "普通会员";
										if (value) {
											if (value == "1") {
												name = "总代理店铺";
											} else if (value == "2") {
												name = "厂家直销会员";
											} else if (value == "7") {
												name = "分公司";
											} else if (value == "9") {
												name = "商务会员";
											}
										}
										return name;
									}
								},
								{
									field : 'op',
									title : '操作',
									width : 40,
									formatter : function(value, row, index) {
										return '<a class="btn" target="_blank" href="javascript:viewMember('
												+ index
												+ ')"><i class="fa fa-search-plus"></i></a>'
									}
								} ] ]
					});
	onLoaded();
});
function query() {

}
function viewMember(index) {
	$("#member-info")[0].reset();
	var rows = $("#mem-info-tb").datagrid("getRows");
	var row = rows[index];
	if (row) {
		$("#member-info").find(".box-footer").find("a.btn").attr("disabled",
				false);
		$("#member-info").form("load", row);
	}
}

function onLoading() {
	$(".overlay").show();
	$("body").data("_xw_worker_loading", "true");
}

function onLoaded() {
	$(".overlay").hide();
	$("body").data("_xw_worker_loading", "false");
}

function check() {
	var isLoading = $("body").data("_xw_worker_loading");
	if (isLoading != undefined && isLoading != null && isLoading == "true") {
		return false;
	}
	return true;
}

function passMember() {
	var params = $("#member-info").serializeJson();
	if (params && params.cust_id && check()) {
		onLoading();
		$.ajax({
			url : "/runtime/services/service_mem_pass",
			data : params,
			type : "post",
			success : function(dt) {
				onLoaded();
				var gson = eval("(" + dt + ")");
				if (gson.errorMsg) {
					alert(gson.errorMsg);
				} else {
					$("#member-info")[0].reset();
					$("#mem-info-tb").datagrid('reload');
				}
			},
			error : function() {
				onLoaded()
			}
		});
	}
}

function deleteMember() {
	var params = $("#member-info").serializeJson();
	if (params && params.cust_id && check()) {
		onLoading();
		$.ajax({
			url : "/runtime/services/service_delete_mem",
			data : params,
			type : "post",
			success : function(dt) {
				onLoaded();
				var gson = eval("(" + dt + ")");
				if (gson.errorMsg) {
					alert(gson.errorMsg);
				} else {
					$("#member-info")[0].reset();
					$("#mem-info-tb").datagrid('reload');
				}
			},
			error : function() {
				onLoaded()
			}
		});
	}
}