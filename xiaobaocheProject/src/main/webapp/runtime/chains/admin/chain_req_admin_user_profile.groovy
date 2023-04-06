import org.nutz.mvc.Mvcs;

import com.dworker.datas.IDatas;
import com.dworker.web.chain.MvcChain;
import com.xwqp88.lang.aware.IData;
import com.xwqp88.mvc.view.IViews;
import com.xwqp88.shop.util.IShops;

class chain_req_admin_profile extends MvcChain {
	@Override
	protected void prepare() {
		super.prepare();
		reqAttrs.admin_header_title = "个人信息管理 | 象网汽配";
		reqAttrs.sidebar_active = "member";
		reqAttrs.sidebar2_active = "info";
		reqAttrs.admin_user = IShops.getAdminUser();
		String custId = IShops.getAdminUser().get("cust_id");
		String userId = IShops.getAdminUser().get("user_id");
		IDatas datas = IDatas.NEW("data_company").cache(false);
		IDatas datas2 = IDatas.NEW("data_user").cache(false)
		reqAttrs.company_mem = datas.makeData(["cust_id": custId]).rows;
		reqAttrs.userInfo = datas2.makeData(["user_id": userId]).rows[0];
		if (reqAttrs.company_mem) {
			reqAttrs.company_mem = reqAttrs.company_mem.size() > 0? reqAttrs.company_mem[0]: new HashMap();
		}
		println reqAttrs.company_mem
		println reqAttrs.userInfo
	}
}