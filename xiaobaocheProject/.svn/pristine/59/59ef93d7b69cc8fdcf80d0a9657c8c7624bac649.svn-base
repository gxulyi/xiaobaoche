import javax.servlet.http.HttpServletRequest;

import groovy.transform.CompileStatic;

import org.nutz.lang.Files;
import org.nutz.lang.Strings;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.view.HttpStatusView;
import org.nutz.mvc.view.UTF8JsonView;
import org.nutz.mvc.view.ViewWrapper;

import com.dworker.chains.IChains;
import com.dworker.chains.core.IChain;
import com.dworker.chains.core.IChainContext;
import com.dworker.chains.core.IChainOut;
import com.dworker.chains.core.impl.IGroovyChain;
import com.dworker.datas.IDatas;
import com.dworker.gvy.lang.GvmLoaders;
import com.dworker.gvy.lang.Gvms;
import com.dworker.lang.IFiles;
import com.dworker.lang.IRegex;
import com.dworker.lang.ant.ICase;
import com.dworker.web.chain.MvcChain;
import com.dworker.web.util.IWebs;
import com.dworker.xwwechat.chain.WechatChain;
import com.xwqp88.mvc.IMvcs;
import com.xwqp88.mvc.view.IViews;

@CompileStatic
class chain_request_filter extends WechatChain {
	protected void prepare() {
		def debug = "false";
		if (debug == "true") {
			this.result = IViews.forw("/updata.html");
			return;
		}
		if (IMvcs.getRuntimeModule(Mvcs.getReq()) == null) {
			context.clear();
			if (Mvcs.getActionContext().getPath().indexOf("admin") != -1) {
				mergeWith("chain_admin_gloable");
				nextChain(reqChain);
				reqAttrs.requestParams = reqParams;
				return;
			}
			try {
				Gvms.runCached("shell_write_visit", Mvcs.getActionContext().getPath(), getIpAddress(Mvcs.getReq()));
			} catch (Exception e) {
				e.printStackTrace()
			}

			/**
			 * 如果是退出登录，那么
			 */
			if (Mvcs.getActionContext().getPath() == "/logout") {
				Mvcs.getHttpSession().setAttribute("__xw_user_login", null);
				this.result = IViews.red("/index");
				return;
			}

			/**
			 * 运行公共设置
			 */
			mergeWith("chain_header_setting");

			/*if (IShops.isLogin()) {
				reqAttrs.isLogin = true;
				reqAttrs.current_user = IShops.getUser();
			}*/

			reqAttrs.requestParams = reqParams;
			if (hasReqChain && reqChain != null) {
				nextChain(reqChain);
			}
		}
	}

	protected MvcChain _reset(IChainContext chainContext) {
		this.context = chainContext;
		this.isSubDomain = false;
		this.result = null;
		this.templatePath = IWebs.getTemplate();
		reqParams = IMvcs.reqMap();
		reqAttrs = reqAttrs();
		path = Mvcs.getActionContext().getPath();
		if (IMvcs.getRuntimeModule(Mvcs.getReq()) != null
				&& IGNORE_RUNTIME_CHAIN) {
		} else {
			this.reqChain = IWebs.parseChain(path);
			if (Mvcs.getActionContext().getPath().indexOf("admin") == -1) {
				this.hasReqChain = Files.isFile(IFiles
						.fetchFast(IWebs.RUNTIME_CHAIN_ROOT + "/request/",
								reqChain, false));
			}
		}
		nextChain(null);
		return this;
	}

	public String getIpAddress(HttpServletRequest request) throws IOException {
		// 获取请求主机IP地址,如果通过代理进来，则透过防火墙获取真实IP地址

		String ip = request.getHeader("X-Forwarded-For");

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			if (ip == null || ip.length() == 0
					|| "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("Proxy-Client-IP");
			}
			if (ip == null || ip.length() == 0
					|| "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("WL-Proxy-Client-IP");
			}
			if (ip == null || ip.length() == 0
					|| "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("HTTP_CLIENT_IP");
			}
			if (ip == null || ip.length() == 0
					|| "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			}
			if (ip == null || ip.length() == 0
					|| "unknown".equalsIgnoreCase(ip)) {
				ip = request.getRemoteAddr();
			}
		} else if (ip.length() > 15) {
			String[] ips = ip.split(",");
			for (int index = 0; index < ips.length; index++) {
				String strIp = (String) ips[index];
				if (!("unknown".equalsIgnoreCase(strIp))) {
					ip = strIp;
					break;
				}
			}
		}
		return ip;
	}
}