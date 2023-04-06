import com.dworker.lang.IRegex;

/**
 * 主要用来匹配前台页面的真实路径
 */
def parsePath = { path ->
	if ("/" == path || "" == path || null == path) {
		path = "/index";
	}
	if (path.startsWith("/company")) {
		String p = IRegex.NEW("/company/([0-9a-zA-Z]++)/index").comp(path).group(0);
		println path;
	}
	if (path == "/download/app") {
		path = "app";
	}
	return path;
}