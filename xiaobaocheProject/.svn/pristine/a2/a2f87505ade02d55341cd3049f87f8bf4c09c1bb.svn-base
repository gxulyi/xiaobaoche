import org.nutz.json.Json;

import com.dworker.datas.IDatas;
import com.dworker.gvy.lang.Gvms;
import com.xwqp88.shop.core.IConsShop;
import com.xwqp88.shop.core.chain.ShopChain;

class chain_p_s_cat extends ShopChain {
	protected void prepare() {
		reqAttrs.crumbs = new ArrayList<Object>();
		def cat = Gvms.runCached(IConsShop.FETCH_SHELL_SCRIPT, "data_category", ["cat_id": reqParams.cat_id]);
		if (cat != null) {
			reqAttrs.crumbs.add(["crumb": cat.cat_name, "crumb_url": ""]);
		}

		def queryParams = ["class_attr": reqParams.cat_id, "biz_type": "f", "rows": 20];
		if (reqParams.pn) {
			queryParams.page = reqParams.pn;
		}
		queryParams.state_code = 'c';
		reqAttrs.bizs = IDatas.NEW().cache(false).makeData("data_normal_biz", queryParams);

		reqAttrs.bizChandis = new ArrayList<String>();
		reqAttrs.bizPinpais = new ArrayList<String>();
		reqAttrs.bizXilies = new ArrayList<String>();
		reqAttrs.bizs.rows.each {
			if (it.chandi != null && !reqAttrs.bizChandis.contains(it.chandi)) {
				reqAttrs.bizChandis.add(it.chandi);
			}
			if (it.pinpai != null && !reqAttrs.bizPinpais.contains(it.pinpai)) {
				reqAttrs.bizPinpais.add(it.pinpai);
			}
			if (it.xilie != null && !reqAttrs.bizXilies.contains(it.xilie)) {
				reqAttrs.bizXilies.add(it.xilie);
			}
		};
	}
}