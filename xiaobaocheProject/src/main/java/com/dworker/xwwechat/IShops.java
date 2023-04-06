package com.dworker.xwwechat;

import java.util.Hashtable;
import java.util.Map;

import org.nutz.mvc.Mvcs;

import com.dworker.chains.IChains;
import com.dworker.chains.core.IChainContext;
import com.dworker.chains.core.impl.IGroovyChain;
import com.dworker.chains.core.impl.SimpleChainContext;
import com.dworker.datas.IDatas;
import com.dworker.factory.IFactorys;
import com.dworker.gvy.lang.Gvms;
import com.dworker.lang.ILogs;
import com.dworker.xwwechat.IConsNews;
import com.dworker.xwwechat.IExceptionResolver;

@SuppressWarnings("unchecked")
public final class IShops implements IConsNews {
	private static Map<String, String> CHAIN_MAPPING = new Hashtable<String, String>();

	public static Map<String, Object> fetchConfig(Object params) {
		return Gvms.run(FETCH_SHELL_SCRIPT, SYS_CONFIG_TABLE, params);
	}

	public static String fetchConfigValue(Object params) {
		return fetchConfigValue(params, null);
	}

	public static String fetchConfigValue(Object params, String def) {
		Map<String, Object> config = fetchConfig(params);
		String val = null;
		if (config != null) {
			val = config.containsKey("sys_param_value") ? String.valueOf(config
					.get("sys_param_value")) : null;
		}
		return val == null ? def : val;
	}

	public static <T> T runChain(String chain, IChainContext chainContext) {
		T t = null;
		try {
			chain().run(new IGroovyChain(chain), chainContext);
			t = (T) chainContext.get("result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}

	public static IChains chain() {
		IChains chains = Mvcs.ctx().reqThreadLocal.get().getAs(IChains.class,
				"__xw_shop_chains");
		if (chains == null) {
			chains = IChains.NEW();
			Mvcs.ctx().reqThreadLocal.get().set("xw_shop_chains", chains);
		}
		return chains;
	}

	public static IChainContext getChainContext() {
		IChainContext context = Mvcs.getActionContext() != null
				&& Mvcs.getActionContext().has("___xw_chain_context") ? Mvcs
				.getActionContext().getAs(IChainContext.class,
						"___xw_chain_context") : null;
		if (context == null) {
			context = new SimpleChainContext();
			if (Mvcs.getActionContext() != null) {
				Mvcs.getActionContext().set("___xw_chain_context", context);
			}
		}
		return context;
	}

	public static IDatas getIDatas() {
		IDatas datas = (IDatas) (Mvcs.getReq() != null ? Mvcs.getReq()
				.getAttribute("___xw_action_idatas_") : null);
		if (datas == null) {
			datas = IDatas.NEW();
			if (Mvcs.getReq() != null) {
				Mvcs.getReq().setAttribute("___xw_action_idatas_", datas);
			}
		}
		return datas;
	}

	public static String parseChain(String path, boolean force) {
		if (path == null) {
			return null;
		}
		if (force) {
			return _parseChain(path);
		}
		String chain = CHAIN_MAPPING.get(path);
		if (chain == null) {
			chain = _parseChain(path);
		}
		return chain;
	}

	private static synchronized String _parseChain(String path) {
		String p = path.replace("/", "_");
		if (p.indexOf("runtime") == -1) {
			p = p.length() <= 0 || p.equals("_") ? "_req_index" : "_req" + p;
		}
		p = p.replace("runtime_services", "req");
		p = p.replace("runtime_datas", "req");
		p = "chain".concat(p);
		CHAIN_MAPPING.put(path, p);
		ILogs.df("解析路径地址为：%s 请求路径：%s", p, path);
		return p;
	}

	public static void setUser(Object obj) {
		if (obj == null || !(obj instanceof Map)) {
			return;
		}
		Mvcs.getHttpSession().setAttribute("__xw_user_login", obj);
	}

	public static boolean isLogin() {
		return getUser() != null;
	}

	public static Map<String, Object> getUser() {
		Object obj = Mvcs.getHttpSession().getAttribute("__xw_user_login");
		if (obj != null) {
			return (Map<String, Object>) obj;
		}
		return null;
	}

	public static boolean isAdminLogin() {
		return getAdminUser() != null;
	}

	public static void setAdminUser(Object obj) {
		if (obj == null || !(obj instanceof Map)) {
			return;
		}
		Mvcs.getHttpSession().setAttribute("__xw_admin_user_login", obj);
	}

	public static Map<String, Object> getAdminUser() {
		Object obj = Mvcs.getHttpSession()
				.getAttribute("__xw_admin_user_login");
		if (obj != null) {
			return (Map<String, Object>) obj;
		}
		return null;
	}

	public static void safeResolveThrowable(Throwable throwable) {
		if (throwable == null) {
			return;
		}
		try {
			IExceptionResolver resolver = IFactorys.make(throwable,
					"app_exception_resolver_factory");
			if (resolver != null) {
				resolver.resolve(throwable);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
