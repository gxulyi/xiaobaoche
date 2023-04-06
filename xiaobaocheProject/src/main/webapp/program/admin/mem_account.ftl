<div class="box box-success account">
    <div class="box-header with-border">
        <h3 class="box-title">账号信息</h3>
            <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            </div>
    </div><!-- /.box-header -->
    <form id="mem-account-form" action="/runtime/services/service_update_user" class="box-body" style="height: 490px;">
        <input type="hidden" class="editable" name="cust_id" value= />
        <input type="hidden" class="editable" name="user_id" value= />
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">账号</span>
                <input type="text" class="form-control " value="" disabled />
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">是否管理员</span>
                <input type="text" class="form-control " value="<#if userInfo.user_type?exists><#if (userInfo.user_type == '0')>管理员<#else>非管理员</#if><#else>非管理员</#if>" disabled />
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">昵称</span>
                <input type="text" name="nick_name" class="form-control editable" value="" />
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">电子邮箱</span>
                <input type="text" name="user_email" class="form-control editable" value="" />
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon">联系电话</span>
                <input type="text" name="user_tel" class="form-control editable" value="" />
            </div>
        </div>
        <div class="form-group">
             <label>性别</label>
                      &nbsp;
                      <input type="radio" class="editable" name="sex_type" <#if userInfo.sex_type?exists><#if (userInfo.sex_type == '0')><#else>checked</#if><#else>checked</#if> class="minimal-red" value="0" disabled />
                      男
                      &nbsp;
                      <input type="radio" class="editable" name="sex_type" <#if userInfo.sex_type?exists><#if (userInfo.sex_type == '1')></#if></#if> class="minimal-red" value="1" disabled/>
                      女
        </div>
        <div class="form-group">
             <img id="real_upload_file" src="" class="thumbnail" style="width: 180px; height: 180px;" />
             <div class="btn btn-default btn-file">
                  <i class="fa fa-paperclip"></i> 帐号头像
                  <input id="up_load_file" class="editable" type="file" name="attachment" disabled/>
             </div>
        </div>
    <div class="box-footer">
        <div class="pull-right">
            <a class="btn btn-primary editable" disabled href="javascript:save('mem-account-form');"><i class="ion ion-share"></i> 保存</a>
        </div><!--/.pull-right-->
        <a class="btn btn-danger" href="javascript:unlockAccount('mem-account-form');"><i class="ion ion-android-delete"></i> 解锁</a>
    </div>
    </form>
</div>

<script>
</script>