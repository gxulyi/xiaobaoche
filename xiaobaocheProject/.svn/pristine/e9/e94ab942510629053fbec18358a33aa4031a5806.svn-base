import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.View;
import org.nutz.mvc.view.HttpStatusView;

import com.dworker.chains.IChains;
import com.dworker.chains.core.IChainContext;
import com.dworker.chains.core.impl.IGroovyChain;
import com.dworker.chains.core.impl.SimpleChainContext;
import com.dworker.datas.IDatas;
import com.dworker.web.chain.observer.ITransObserver;
import com.xwqp88.dao.IDaos;
import com.xwqp88.mvc.IMvcs;
import com.xwqp88.mvc.view.IViews;
import com.xwqp88.shop.core.services.BaseChainService;
import com.dworker.web.services.BaseService;
import com.dworker.xwwechat.IShops;
import com.xwqp88.util.MD5Util;

class service_admin_login extends BaseService{
	@Override
	protected void init() {
		// TODO Auto-generated method stub
		super.init();
		def loginParams = IMvcs.reqMap();
		String s = "SELECT t.user_id, t.user_type, t.user_name, t.real_name, t.nick_name,t.user_email,tt.user_class,t.cust_id,tt.cust_name,(SELECT file_path FROM ti_attach where attach_root_id = t.user_id LIMIT 0,1) file_path FROM ti_user t RIGHT JOIN ti_member tt on tt.cust_id = t.cust_id";
		s = s + " where t.user_name = @user_name and t.passwd = @passwd and tt.user_class in ('s', '1', '7', '8')";
		Sql sql = Sqls.create(s);
		Dao dao = IDaos.getDao("dataSource");
		sql.setCallback(Sqls.callback.record());
		sql.params().set("user_name", loginParams.user_name).set("passwd", MD5Util.md5Hex(loginParams.password));
		dao.execute(sql);
		def record = sql.getResult();
		if (record != null) {
			IShops.setAdminUser(record);
			//execAtoms("chain_t_onlogin");
		}
		String url = loginParams.post_url == null? "/program/admin/index": loginParams.post_url;
		this.orginalView = IViews.red(url);
	}
}