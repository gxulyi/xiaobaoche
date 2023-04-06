import com.dworker.datas.IDatas
import com.dworker.xwwechat.chain.WechatChain

class chain_admin_area extends WechatChain{
	@Override
	protected void prepare() {
		// TODO Auto-generated method stub
		super.prepare();
		IDatas datas = IDatas.NEW("data_area");
		reqAttrs.areas = datas.makeData(["up_area_id": "000000000000000"]).rows;
	}
	
}