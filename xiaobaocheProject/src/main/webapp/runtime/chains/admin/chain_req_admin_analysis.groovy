import org.nutz.mvc.Mvcs;

import com.dworker.web.chain.MvcChain;
import com.xwqp88.dao.IDaos;
import com.xwqp88.mvc.view.IViews;
import com.xwqp88.shop.util.IShops;
import com.xwqp88.util.DateUtil;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.util.Daos;

class chain_req_admin_biz_detail extends MvcChain {
	@Override
	protected void prepare() {
		super.prepare();
		def adminUser = IShops.getAdminUser();
		if (adminUser) {
			Cnd cnd = Cnd.NEW();
			if ("s" == adminUser.user_class) {
				superAnalysis();
			} else if ("1" == adminUser.user_class) {
				analysis(adminUser.cust_id);
			}
		}
	}
	
	private void superAnalysis(){
		Dao dao = IDaos.getDao("dataSource");
		Sql sql = Sqls.create("SELECT SUM(req_price) FROM ti_inquiry");
		sql.setCallback(Sqls.callback.doubleValue());
		try {
			dao.execute(sql);
			reqAttrs.trade_total_money = sql.getNumber().doubleValue();
		} catch (Exception e) {
			e.printStackTrace()
		}
	}
	
	private void analysis(cust_id){
		Dao dao = IDaos.getDao("dataSource");
		Sql sql = Sqls.create("SELECT SUM(req_price) FROM ti_inquiry where s_cust_id = @cust_id");
		sql.params().set("cust_id", cust_id);
		sql.setCallback(Sqls.callback.doubleValue());
		try {
			dao.execute(sql);
			reqAttrs.trade_total_money = sql.getNumber().doubleValue();
		} catch (Exception e) {
			e.printStackTrace()
		}
	}
}