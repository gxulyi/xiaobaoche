import org.nutz.mvc.Mvcs;

import com.dworker.web.chain.MvcChain;
import com.xwqp88.mvc.view.IViews;
import com.xwqp88.shop.util.IShops;

class chain_req_admin_clear_cache extends MvcChain {
	@Override
	protected void prepare() {
		super.prepare();
		reqAttrs.sidebar_active = "sys";
		reqAttrs.sidebar2_active = "clear_cache";
	}
}