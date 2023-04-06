import org.nutz.lang.Strings
import org.nutz.lang.util.NutMap

import com.dworker.datas.IDatas
import com.dworker.xwwechat.chain.WechatChain

class chain_req_admin_news_modify  extends WechatChain {
	@Override
	protected void prepare() {
		super.prepare();
		mergeWith("chain_req_admin_help");
		IDatas datas = IDatas.NEW("data_query_news").cache(false);
		def rows = datas.makeData(["news_id": Strings.sBlank(reqParams.id, "null")]).rows;
		
		reqAttrs.modify_news= rows.size() > 0? rows[0]: NutMap.NEW();
	}
}