import org.nutz.mvc.Mvcs;

import com.dworker.web.chain.MvcChain;
import com.xwqp88.mvc.view.IViews;
import com.xwqp88.shop.util.IShops;

class chain_req_admin_member extends MvcChain {
	@Override
	protected void prepare() {
		super.prepare();
		reqAttrs.admin_header_title = "会员档案管理 | 象网汽配";
		reqAttrs.sidebar_active = "member";
		reqAttrs.sidebar2_active = "info";
	}
}