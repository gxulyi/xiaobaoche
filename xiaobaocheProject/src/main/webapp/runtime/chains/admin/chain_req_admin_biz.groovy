import com.dworker.xwwechat.chain.WechatChain;

class chain_req_admin_biz extends WechatChain {
	@Override
	protected void prepare() {
		super.prepare();
		reqAttrs.sidebar_active = "goods";
		reqAttrs.sidebar2_active = "biz";
	}
}