import org.nutz.mvc.Mvcs;

import com.dworker.web.chain.MvcChain;
import com.xwqp88.mvc.view.IViews;

class chain_admin_gloable extends MvcChain {
	@Override
	protected void prepare() {
		super.prepare();
		reqAttrs.tpl = "/program/admin/";
		reqAttrs.admin_logo_name = "亿象网络";
		reqAttrs.admin_version = "1.0";
		reqAttrs.admin_host = "http://www.xwqp88.com";
		reqAttrs.user_host = "http://www.xwqp88.com";
		reqAttrs.admin_valid_time = "2014-2015";
		nextChain("chain_admin_header_setting");
		this.result = IViews.forw(Mvcs.getActionContext().getPath() + ".ftl");
	}
}