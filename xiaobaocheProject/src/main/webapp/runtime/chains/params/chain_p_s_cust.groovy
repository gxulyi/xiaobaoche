import org.nutz.lang.Strings;

import com.dworker.datas.IDatas;
import com.dworker.gvy.lang.Gvms;
import com.xwqp88.shop.core.IConsShop;
import com.xwqp88.shop.core.chain.ShopChain;

class chain_p_s_cust extends ShopChain {
	protected void prepare() {
		reqAttrs.crumbs = new ArrayList<Object>();
		def cat = Gvms.runCached(IConsShop.FETCH_SHELL_SCRIPT, "data_member", ["cust_id": reqParams.cust_id]);
		if (cat != null) {
			reqAttrs.crumbs.add(["crumb": cat.cust_name, "crumb_url": ""]);
		    reqAttrs.pageTitle = cat.cust_name + " - 象网汽配";
		}
		if (reqParams.root_id) {
			reqParams.cust_id = reqParams.root_id;
		}
		def queryParams = ["state_code": "c", "cust_id": Strings.sBlank(reqParams.cust_id, "null"), "biz_type": "f", "rows": 20];
		
		if (reqParams != null) {
			reqParams.each {
				if (it.key != "pn" && !Strings.isBlank(it.value)) {
					queryParams.put(it.key, it.value);
				}
			}
			if (reqParams.pn) {
				queryParams.put("page", reqParams.pn);
			}
		}
		reqAttrs.bizs = IDatas.NEW().cache(false).makeData("data_normal_biz", queryParams);
		nextChain("chain_search_pinpai");
	}
}