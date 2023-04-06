import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.mvc.Mvcs;

import com.dworker.datas.IDatas;
import com.dworker.web.chain.MvcChain;
import com.xwqp88.mvc.view.IViews;
import com.xwqp88.shop.util.IShops;

class chain_req_admin_m_biz extends MvcChain {
	@Override
	protected void prepare() {
		super.prepare();
		mergeWith("chain_req_admin_biz_detail");
		IDatas datas = IDatas.NEW("data_normal_biz_detail").cache(false);
		def rows = datas.makeData(["model_id": Strings.sBlank(reqParams.id, "null")]).rows;
		reqAttrs.model_info = rows.size() > 0? rows[0]: NutMap.NEW();
		reqAttrs.model_info = reqAttrs.model_info? reqAttrs.model_info: [:];
		if (reqAttrs.model_info.biz_id == null) {
			if (!Strings.isBlank(reqParams.biz_id)) {
				reqAttrs.model_info.biz_id = reqParams.biz_id;
			}
		}
		
		datas = IDatas.NEW("data_normal_biz");
		if (reqAttrs.model_info.biz_id) {
			reqAttrs.biz_info = datas.makeData(["biz_id": reqAttrs.model_info.biz_id]).rows;
			reqAttrs.biz_info = reqAttrs.biz_info.size() > 0? reqAttrs.biz_info[0]: NutMap.NEW();
		} else if (reqParams.id) {
			reqAttrs.biz_info = datas.makeData(["biz_id": reqParams.id]).rows;
			reqAttrs.biz_info = reqAttrs.biz_info.size() > 0? reqAttrs.biz_info[0]: [:];
		}
		reqAttrs.biz_info = reqAttrs.biz_info? reqAttrs.biz_info: [:];
	}
}