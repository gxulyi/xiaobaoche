import org.nutz.mvc.Mvcs;

import com.dworker.chains.core.IChainContext;
import com.dworker.chains.core.IChainOut;
import com.dworker.chains.core.impl.IGroovyChain;
import com.dworker.datas.IDatas;
import com.dworker.lang.ILogs;
import com.dworker.web.util.IWebs;
import com.dworker.xwwechat.chain.WechatChain;
import com.xwqp88.mvc.IMvcs;

class chain_header_setting extends WechatChain {
	protected void prepare() {
		reqAttrs.tpl = IWebs.getTemplate();
		reqAttrs.pageTitle = "象网汽配城_汽配商城_亿象网络科技";
		reqAttrs.pageKeywords = "象网汽配,象网汽配城,汽配,汽配城,汽配商城,汽修,汽修商城";
		reqAttrs.pageContent = "象网汽配城,您最贴心、最便捷、最全面、最专业的网上汽配商城、汽修导航、汽修专业指导服务，我们竭诚为您提供最放心的汽配服务！";
		reqAttrs.isLogin = false;
		reqAttrs.pageEncoding = "utf-8";
		reqAttrs.localLanguage = "";
		reqAttrs.reqPath = Mvcs.getActionContext().getPath();
		reqAttrs.app_front_version = "Beta 0.0.111";
		reqAttrs.appIsDebug = "off";
	}
}