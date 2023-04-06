import org.nutz.mvc.Mvcs;

import com.dworker.lang.ILogs;
import com.dworker.web.util.IWebs;

/**
 * 主要用来匹配req的chain过滤
 */
def parseChain = {
	path ->
	if (String.valueOf(path).startsWith(IWebs.getTemplate())) {
		return null;
	}
	if (path == "/j_test") {
		return "chain_req_test";
	}
	String p = path.replace("/", "_");
	if (p.indexOf("runtime") == -1) {
		p = p.length() <= 0 || p.equals("_")? "_req_index": "_req" + p;
	}
	p = p.replace("runtime_services", "req");
	p = p.replace("runtime_datas", "req");
	p = p.replace("runtime_services", "req");
	p = p.replace("admin_admin", "admin");
	p = p.replace("program_admin", "admin");
	p = "chain".concat(p);
	ILogs.df("解析路径地址为：%s 请求路径：%s", p, path);
	return p;
}