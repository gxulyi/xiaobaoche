import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.mvc.Mvcs;

import com.dworker.datas.IDatas;
import com.dworker.web.chain.MvcChain;
import com.xwqp88.mvc.view.IViews;
import com.dworker.xwwechat.chain.WechatChain;

class chain_req_admin_m_biz extends WechatChain {
	@Override
	protected void prepare() {
		super.prepare();
		/*mergeWith("chain_req_admin_biz");
		IDatas datas = IDatas.NEW("data_normal_biz").cache(false);
		def rows = datas.makeData(["biz_id": Strings.sBlank(reqParams.id, "null")]).rows;
		reqAttrs.biz_info = rows.size() > 0? rows[0]: NutMap.NEW();
		datas = IDatas.NEW("data_category");
		reqAttrs.catagory = datas.makeData(["class_type": "12", "up_cat_id": "000000000000000"]).rows;
		if (reqAttrs.biz_info.class_attr) {
			String[] clss = reqAttrs.biz_info.class_attr.split("\\|");
			if(clss != null && clss.length >= 1){
				reqAttrs.catagory1 = datas.makeData(["class_type": "12", "up_cat_id": clss[0]]).rows;
			}
		}*/
	}
}