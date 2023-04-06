import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.json.Json;
import org.nutz.mvc.Mvcs;

import com.dworker.web.chain.TransChain;
import com.xwqp88.shop.core.chain.ShopTransChain;
import com.xwqp88.shop.util.IShops;

/**
 * 用户登录成功后的事务入口
 * @author Llong
 *
 */
class trans_update_login extends ShopTransChain{
	protected void prepare() {

		def params = IShops.getUser();
		if (params != null) {
			addAtom({
				transDao.update("ti_user", Chain.make("last_login", new Date(System.currentTimeMillis())), Cnd.where("user_id", "=", params.user_id));
			});
		}
	}
}