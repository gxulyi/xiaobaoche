import org.nutz.mvc.Mvcs;

import com.dworker.web.chain.MvcChain;
import com.xwqp88.mvc.view.IViews;
import com.xwqp88.shop.util.IShops;

class chain_req_admin_category extends MvcChain {
	@Override
	protected void prepare() {
		super.prepare();
		reqAttrs.sidebar_active = "goods";
		reqAttrs.sidebar2_active = "category";
	}
}