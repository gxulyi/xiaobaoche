import org.nutz.lang.Strings
import org.nutz.lang.util.NutMap

import com.dworker.datas.IDatas
import com.dworker.xwwechat.chain.WechatChain

class chain_req_admin_news_detail  extends WechatChain {
	@Override
	protected void prepare() {
		super.prepare();
		mergeWith("chain_req_admin_help");
		IDatas datas = IDatas.NEW("data_query_news").cache(false);
		def rows = datas.makeData(["news_id": Strings.sBlank(reqParams.id, "null")]).rows;
		reqAttrs.detail_news= rows.size() > 0? rows[0]: NutMap.NEW();
		
		if (reqAttrs.detail_news.attach_id == null) {
			if (!Strings.isBlank(reqParams.attach_id)) {
				reqAttrs.detail_news.attach_id = reqParams.attach_id;
			}
		}
		
		datas = IDatas.NEW("data_attach");
		if (reqAttrs.detail_news.attach_id) {
			reqAttrs.attach_news= datas.makeData(["attach_id": reqAttrs.detail_news.attach_id]).rows;
			reqAttrs.attach_news = reqAttrs.attach_news.size() > 0? reqAttrs.attach_news[0]: NutMap.NEW();
		} else if (reqParams.id) {
			reqAttrs.attach_news = datas.makeData(["attach_id": reqParams.id]).rows;
			reqAttrs.attach_news = reqAttrs.attach_news.size() > 0? reqAttrs.attach_news[0]: [:];
		}
		reqAttrs.attach_news = reqAttrs.attach_news? reqAttrs.attach_news: [:];
		
	}
}