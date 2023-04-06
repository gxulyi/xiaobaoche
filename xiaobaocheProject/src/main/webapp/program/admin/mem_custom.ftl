<div class="box box-success custom">
    <div class="box-header with-border">
        <h3 class="box-title">档案信息</h3>
            <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            </div>
    </div><!-- /.box-header -->
    <form id="mem-custom-form" action="/runtime/services/service_update_member" class="box-body" style="height: 490px;">
        <input type="hidden" class="editable" name="cust_id" value="" />
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">档案名称</span>
                <input type="text" class="form-control" value="" disabled />
            </div>
        </div>
    <div class="box-footer">
        <div class="pull-right">
            <a class="btn btn-primary editable" disabled href="javascript:save();"><i class="ion ion-share"></i> 保存</a>
        </div><!--/.pull-right-->
        <#if current_user.user_type?exists><#if (current_user.user_type == '0')>
        <a class="btn btn-danger" href="javascript:unlockAccount('mem-custom-form');"><i class="ion ion-android-delete"></i> 解锁</a>
        </#if></#if>
    </div>
    </form>
</div>
<#if current_user.user_type?exists>
<#if (current_user.user_type == '0')>
<script>
</script>
</#if>
</#if>