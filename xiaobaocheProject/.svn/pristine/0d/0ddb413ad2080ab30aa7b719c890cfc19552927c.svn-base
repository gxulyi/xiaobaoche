import org.nutz.mvc.Mvcs;

import com.xwqp88.mvc.IMvcs;
import com.xwqp88.mvc.view.IViews;
import com.xwqp88.shop.core.chain.ShopChain;
import com.xwqp88.shop.util.IShops;

class chain_req_admin_logout extends ShopChain {
	@Override
	protected void prepare() {
		// TODO Auto-generated method stub
		super.prepare();
		Mvcs.getHttpSession().setAttribute("__xw_admin_user_login", null);
		result = IViews.red("/program/admin/login");
	}
}