import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;

import com.dworker.chains.core.IChainContext;
import com.dworker.chains.core.IChainOut;
import com.dworker.chains.core.impl.IGroovyChain;
import com.dworker.datas.IDatas;
import com.xwqp88.shop.util.IShops;

class cal_model_mon extends IGroovyChain{
	def model_id;
	def model_info;
	def biz_info;
	def shop_info;
	def user_info;
	def vip_info;
	int num;
	@Override
	public IChainOut out(IChainContext context) {
		// TODO Auto-generated method stub
		_reset(context);
		cal(context);
		if (!context.has("no_need_facts")) {
			nextChain("chain_cal_receipt");
		}
		return super.out(context);
	}

	private void cal(IChainContext context){
		double price = dispatchPrice();
		context.set("price", price);
		double total = price * (double)num;
		context.set("total", total);
		context.set("real_price", price);
		context.set("real_total", total);
	}

	private double dispatchPrice(){
		if (vip_info != null && vip_info.size() > 0) {
			return Double.parseDouble(String.valueOf(model_info.vip_biz_price));
		}
		user_info.user_class = Strings.sBlank(user_info.user_class, "0");
		if (user_info.user_class == "9") {
			return Double.parseDouble(String.valueOf(model_info.union_biz_price));
		}
		return Double.parseDouble(String.valueOf(model_info.biz_price));
	}

	protected void _reset(IChainContext context){
		model_id = context.getString("model_id");
		if (context.has("model_info")) {
			model_info = context.get("model_info");
		} else {
			IDatas datas = IDatas.NEW("data_normal_biz_detail").cache(false);
			model_info = datas.makeData(["model_id": model_id]).rows;
			model_info = model_info.size()>0?model_info[0]:NutMap.NEW();
			context.set("model_info", model_info);
		}
		if (context.has("biz_info")) {
			biz_info = context.get("biz_info");
		} else {
			IDatas datas = IDatas.NEW("data_normal_biz");
			biz_info = datas.makeData(["biz_id": model_info.biz_id]).rows;
			biz_info = biz_info.size()>0?biz_info[0]:NutMap.NEW();
			context.set("biz_info", biz_info);
		}
		if (context.has("shop_info")) {
			shop_info = context.get("shop_info");
		} else {
			IDatas datas = IDatas.NEW("data_member");
			shop_info = datas.makeData(["cust_id": model_info.cust_id]).rows;
			shop_info = shop_info.size()>0?shop_info[0]:NutMap.NEW();
			context.set("shop_info", shop_info);
		}
		vip_info = null;
		if (context.has("user_info")) {
			user_info = context.get("user_info");
		} else {
			user_info = IShops.getUser();
			context.set("user_info", user_info);
		}
		if (user_info == null) {
			user_info = NutMap.NEW();
		}
		num = 1;
		if (context.has("num")) {
			try {
				num = Integer.parseInt(String.valueOf(context.get("num")));
			} catch (Exception e) {
				e.printStackTrace()
			}
		}
	}
}