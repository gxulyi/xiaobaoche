<div class="box box-success company">
    <div class="box-header with-border">
        <h3 class="box-title">公司信息</h3>
            <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            </div>
    </div><!-- /.box-header -->
    <form id="mem-company-form" action="/runtime/services/service_update_company"  class="box-body" style="height: 450px;">
        <input type="hidden" class="editable" name="cust_id" value="">
        <div class="form-group col-md-6">
            <div class="input-group">
                <span class="input-group-addon">公司名称</span>
                <input type="text" class="form-control " name="short_name" value="" disabled />
            </div>
        </div>
        <div class="form-group col-md-6">
            <div class="input-group">
                <span class="input-group-addon">经营范围</span>
                <input type="text" class="form-control editable" name="company_supply"  value=""  />
            </div>
        </div>
        <div class="form-group col-md-6">
            <div class="input-group">
                <span class="input-group-addon">主营业务</span>
                <input type="text" class="form-control editable" name="main_product" value=""  />
            </div>
        </div>
        <div class="form-group col-md-6">
            <div class="input-group">
                <span class="input-group-addon">公司地址</span>
                <input type="text" class="form-control editable" name="company_addr" value=""  />
            </div>
        </div>
        <div class="form-group col-md-6">
            <div class="input-group">
                <span class="input-group-addon">商务地址</span>
                <input type="text" class="form-control editable" name="business_addr" value=""  />
            </div>
        </div>
        <div class="form-group col-md-6">
            <div class="input-group">
                <span class="input-group-addon">联&nbsp;&nbsp;系&nbsp;&nbsp;人 </span>
                <input type="text" class="form-control editable" name="contact_name" value=""  />
            </div>
        </div>
        <div class="form-group col-md-6">
            <div class="input-group">
                <span class="input-group-addon">联系电话</span>
                <input type="text" class="form-control editable" name="contact_cellphone" value=""  />
            </div>
        </div>
        <div class="form-group col-md-6">
            <div class="input-group">
                <span class="input-group-addon">注&nbsp;&nbsp;册&nbsp;&nbsp;号</span>
                <input type="text" class="form-control editable" name="reg_no" value=""  />
            </div>
        </div>
        <div class="form-group one">
            <div class="input-group">
                <span class="input-group-addon">注册地址</span>
                <input type="text" class="form-control editable" name="reg_addr" value=""  />
            </div>
        </div>
        <div class="form-group one" >
            <div class="input-group">
                <span class="input-group-addon">公司资质</span>
                <textarea id="html-content" class="editable" name="company_desc" class="form-control" rows="10" placeholder="请输入 ..." ></textarea>
            </div>
        </div>
        <div class="form-group one" >
            <div class="input-group">
                <span class="input-group-addon">公司简介</span>
                <textarea id="html-content2" class="editable" name="compnay_about_us" class="form-control" rows="10" placeholder="请输入 ..." ></textarea>
            </div>
        </div>
    <div class="box-footer">
        <div class="pull-right">
            <a class="btn btn-primary editable" disabled href="javascript:save('mem-company-form');"><i class="ion ion-share"></i> 保存</a>
        </div><!--/.pull-right-->
        <a class="btn btn-danger" href="javascript:unlockAccount('mem-company-form');"><i class="ion ion-android-delete"></i> 解锁</a>
    </div>
    </form>
</div>

