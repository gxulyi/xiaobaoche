import com.dworker.xwwechat.chain.WechatChain;

class chain_req_index extends WechatChain {
	@Override
	protected void prepare() {
		// TODO Auto-generated method stub
		super.prepare();
		
		println "我開始訪問首頁了";
		
		reqAttrs.datas = ["1", "2"];
	}
}