import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;

import com.xwqp88.mvc.IMvcs;
import com.xwqp88.shop.core.chain.ShopTransChain;
import com.xwqp88.shop.util.IShops;
import com.xwqp88.util.NumberUtil;

class chain_update_member extends ShopTransChain{
	def form_params = null;
	def attach_params = null;
	@Override
	protected void prepare() {
		// TODO Auto-generated method stub
		super.prepare();
		if (!IShops.isLogin()) {
			return;
		}
		form_params = IMvcs.reqMap();
		if (context.has("form_params")) {
			form_params = context.get("form_params");
		}
		if (form_params.cust_name) {
			form_params.cust_name = new String(form_params.cust_name.getBytes("iso8859-1"), "utf-8");
		}
		if (form_params.nick_name) {
			form_params.nick_name = new String(form_params.nick_name.getBytes("iso8859-1"), "utf-8");
		}
		if (form_params.real_name) {
			form_params.real_name = new String(form_params.real_name.getBytes("iso8859-1"), "utf-8");
		}
		if (form_params.addr) {
			form_params.addr = new String(form_params.addr.getBytes("iso8859-1"), "utf-8");
		}
		attach_params = context.get("attach_params");
		/**
		 * 更新当前用户档案信息
		 */
		addAtom {
			def user = IShops.getUser();
			Cnd cnd = Cnd.where("user_id", "=", user.user_id);
			Chain chain = null;
			def namelist = ["nick_name", "real_name", "sex_type", "user_email", "user_tel"];
			form_params.each {
				if (namelist.contains(it.key)) {
					if (chain == null) {
						chain = Chain.make(it.key, it.value);
					} else {
						chain.add(it.key, it.value);
					}
				}
			}
			if (chain != null) {
				transDao.update("ti_user", chain, cnd);
			}
		};
		addAtom {
			def user = IShops.getUser();
			Cnd cnd = Cnd.where("cust_id", "=", user.cust_id);
			Chain chain = null;
			def namelist = ["cust_name", "addr"];
			form_params.each {
				if (namelist.contains(it.key)) {
					if (chain == null) {
						chain = Chain.make(it.key, it.value);
					} else {
						chain.add(it.key, it.value);
					}
				}
			}
			if (chain != null) {
				transDao.update("ti_member", chain, cnd);
			}
		};
		addAtom {
			def user = IShops.getUser();
			form_params.each {
				if (it.key != null) {
					user.put(it.key, it.value);
				}
			}
			attach_params.each {
				if (it.key != null && it.key != "user_id" && user.containsKey(it.key)) {
					user.put(it.key, it.value);
				}
			}
		};

		if (form_params.longtitude && form_params.longtitude.trim().length() > 0) {
			addAtom {
				def user = IShops.getUser();
				transDao.clear("ti_lbs", Cnd.where("root_id", "=", user.cust_id).and("type", "=", "0"));
				def lbsMap = [:];
				lbsMap.put(".table", "ti_lbs");
				lbsMap.id = NumberUtil.randomChar(20);
				lbsMap.longtitude = form_params.longtitude;
				lbsMap.latitude = form_params.latitude;
				lbsMap.type = "0";
				lbsMap.root_id = user.cust_id;
				lbsMap.title = user.cust_name;
				lbsMap.in_date = new Date();
				
				transDao.insert(lbsMap);
			};
		}
	}

}