import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.mvc.Mvcs;

import com.dworker.datas.IDatas;
import com.dworker.web.chain.MvcChain;
import com.xwqp88.mvc.view.IViews;
import com.xwqp88.shop.util.IShops;

class chain_req_admin_m_user extends MvcChain {
	@Override
	protected void prepare() {
		super.prepare();
		reqAttrs.admin_header_title = "象网汽配 | 公司信息维护";
		mergeWith("chain_req_admin_add_company");
		IDatas datas = IDatas.NEW("data_member").cache(false);
		def rows = datas.makeData(["cust_id": Strings.sBlank(reqParams.id, "null"), "from_cust": "true"]).rows;
		reqAttrs.user_info = rows.size() > 0? rows[0]: NutMap.NEW();

		if (reqParams.id) {
			datas = IDatas.NEW("data_company").cache(false);
			reqAttrs.company_info = datas.makeData(["cust_id": reqParams.id]).rows;
			reqAttrs.company_info = reqAttrs.company_info.size() > 0? reqAttrs.company_info[0]: new HashMap<String, Object>();
		} else {
			reqAttrs.company_info = new HashMap<String, Object>();
		}
		datas = IDatas.NEW("data_area");
		reqAttrs.area_level_1 = datas.makeData(["up_area_id": "000000000000000"]).rows;
		def provice_id = Strings.sBlank(reqAttrs.company_info.area_attr, reqAttrs.area_level_1[0].area_id);
		def city_id = Strings.sBlank(reqAttrs.company_info.area_attr, "");
		if (city_id != null) {
			city_id = city_id.length() > 31? provice_id.substring(16,31): city_id;
		}
		if (provice_id != null) {
			provice_id = provice_id.length() > 15? provice_id.substring(0,15): provice_id;
			reqAttrs.area_level_2 = datas.makeData(["up_area_id": provice_id]).rows;
			city_id = Strings.sBlank(city_id, reqAttrs.area_level_2[0].area_id);
		}
		if (city_id != null) {
			reqAttrs.area_level_3 = datas.makeData(["up_area_id": city_id]).rows;
		}
		datas = IDatas.NEW("data_category");
		reqAttrs.category = datas.makeData(["up_cat_id": "000000000000000"]).rows;
		mergeWith("chain_admin_area");
	}
}