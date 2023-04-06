import javax.servlet.http.HttpServletRequest;

import org.nutz.mvc.Mvcs;

import com.dworker.datas.IDatas;
import com.xwqp88.shop.core.data.ShopSysConfig;

def loadData = {
	template, path ->
	def result = ["tpl": template, "path": path, "configs": new ShopSysConfig()];
	IDatas datas = IDatas.get();
	HttpServletRequest req = Mvcs.getReq();
	println path;
	if ("/index" == path) {
		req.setAttribute("categories", datas.setDataSource("data_category").makeData(["up_cat_id": "000000000000000", "rows": 9]).rows);
		req.setAttribute("news", datas.setDataSource("data_news").makeData(["rows": 8, "state_code": "c"]).rows);
	}
	result;
}