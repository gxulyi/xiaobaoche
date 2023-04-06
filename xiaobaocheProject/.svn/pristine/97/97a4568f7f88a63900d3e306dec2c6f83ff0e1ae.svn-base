import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;

import com.dworker.chains.core.IChainContext;
import com.dworker.chains.core.IChainOut;
import com.dworker.chains.core.impl.IGroovyChain;
import com.dworker.datas.IDatas;
import com.xwqp88.shop.util.IShops;

class cal_model_receipt_mon extends IGroovyChain{
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
		nextChain(null);
		return super.out(context);
	}

	private void cal(IChainContext context){
		double price = context.getDouble("price");
		boolean requireReceipt = false;
		String receipt = "n_receipt";
		if (context.has("requireReceipt")) {
			try {
				requireReceipt = Boolean.parseBoolean(String.valueOf(context.get("requireReceipt")));
			} catch (Exception e) {
				e.printStackTrace()
			}
		}
		if(requireReceipt){
			receipt = context.getString("receipt_type");
			receipt = Strings.sBlank(receipt, "n_receipt");
		}
		context.set("requireReceipt", requireReceipt);
		context.set("receipt_type", receipt);
		if(requireReceipt){
			double facts = 0.0d;
			Object factsNums = "0.0";
			if ("a_receipt" == receipt) {
				factsNums = String.valueOf(model_info.a_receipt);
				factsNums = Strings.sBlank(factsNums, String.valueOf(biz_info.a_receipt));
				factsNums = Strings.sBlank(factsNums, "0.0");
			}
			if ("n_receipt" == receipt) {
				factsNums = String.valueOf(model_info.n_receipt);
				factsNums = Strings.sBlank(factsNums, String.valueOf(biz_info.n_receipt));
				factsNums = Strings.sBlank(factsNums, "0.0");
			}
			try {
				facts = Double.parseDouble(String.valueOf(factsNums));
			} catch (Exception e) {
				e.printStackTrace()
			}
			facts = facts > 1? facts / 100.0: facts;
			context.set("facts", facts);
			double real = (1.0 + facts) * price;
			double r_total = real * (double)num;
			context.set("real_price", real);
			context.set("real_total", r_total);
		}
	}

	protected void _reset(IChainContext context){
		model_id = context.getString("model_id");
		if (context.has("model_info")) {
			model_info = context.get("model_info");
		} else {
			IDatas datas = IDatas.NEW("data_normal_biz_detail");
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