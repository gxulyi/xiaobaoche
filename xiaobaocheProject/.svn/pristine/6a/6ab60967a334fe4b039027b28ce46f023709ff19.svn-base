import org.nutz.lang.Strings;
import org.nutz.mvc.Mvcs;

import com.dworker.xwwechat.chain.WechatChain;
import com.dworker.chains.core.IChainContext;
import com.dworker.chains.core.IChainOut;
import com.dworker.chains.core.impl.IGroovyChain;
import com.dworker.datas.IDatas;
import com.dworker.lang.ILogs;
import com.dworker.web.util.IWebs;
import com.xwqp88.mvc.IMvcs;

class chain_admin_header_setting extends WechatChain {
	protected void prepare() {
		String path = "/program/admin/";
		reqAttrs.tpl = path;
		reqAttrs.admin_logo_name = "亿象网络";
		reqAttrs.admin_version = "1.0";
		reqAttrs.admin_host = "http://www.xwqp88.com";
		reqAttrs.user_host = "http://www.xwqp88.com";
		reqAttrs.admin_valid_time = "2014-2015";
		reqAttrs.sidebar_active = "index";
		reqAttrs.sidebar2_active = "null";
		reqAttrs.admin_header_title = "象网汽配 | 控制台";
	}
}