import com.dworker.datas.IDatas;
import com.xwqp88.shop.core.chain.ShopChain;

class chain_req_admin_biz_multi extends ShopChain{
	protected void prepare() {
		super.prepare();
		reqAttrs.sidebar_active = "goods";
		reqAttrs.sidebar2_active = "biz_multi";
		
		IDatas datas = IDatas.NEW("data_category");
		reqAttrs.category = datas.makeData(["up_cat_id": "000000000000000", "class_type": "12"]).rows;
		if(reqAttrs.category){
			def cat = reqAttrs.category[0];
			reqAttrs.sub_category = datas.makeData(["up_cat_id": cat.cat_id, "class_type": "12"]).rows;
		}
	}
}