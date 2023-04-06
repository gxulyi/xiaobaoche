import org.nutz.json.Json;

import com.dworker.datas.IDatas;
import com.dworker.gvy.lang.Gvms;
import com.xwqp88.shop.core.IConsShop;
import com.xwqp88.shop.core.chain.ShopChain;

class chain_ps_detail_cat extends ShopChain {
	protected void prepare() {
		reqAttrs.crumbs = new ArrayList<Object>();
		def cat = Gvms.runCached(IConsShop.FETCH_SHELL_SCRIPT, "data_category", ["cat_id": reqParams.cat_id]);
		if (cat != null) {
			reqAttrs.crumbs.add(["crumb": cat.cat_name, "crumb_url": ""]);
		}
	}
}