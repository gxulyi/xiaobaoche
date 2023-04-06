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
		mergeWith("chain_req_admin_help");
		IDatas datas = IDatas.NEW("data_abount_info").cache(false);
		def rows = datas.makeData(["info_id": Strings.sBlank(reqParams.id, "null")]).rows;
		reqAttrs.abount_info = rows.size() > 0? rows[0]: NutMap.NEW();
	}
}