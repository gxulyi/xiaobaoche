import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.lang.Strings;
import org.nutz.trans.Atom;

import com.xwqp88.mvc.IMvcs;
import com.xwqp88.shop.core.chain.ShopTransChain;
import com.xwqp88.util.DateUtil;
import com.xwqp88.util.NumberUtil;

class chain_cal_order extends ShopTransChain implements Atom{
	def data, tradeId, infoId;
	def model_info,biz_info,shop_info,user_info;
	@Override
	protected void prepare() {
		// TODO Auto-generated method stub
		super.prepare();
		_mergeContext();
		mergeWith("chain_cal_model_mon");
		data = context.getMap();
		model_info = data.model_info;
		biz_info = data.biz_info;
		shop_info = data.shop_info;
		user_info = data.user_info;
		tradeId  = context.has("trade_id")? context.get("trade_id"):NumberUtil.randomChar(15);
		infoId  = context.has("seq_no")? context.get("seq_no"):DateUtil.format(new Date(), "yyyyMMddHHmmssSSS");
		addAtom(this);
	}

	public void run() {
		def chain1 = Chain.make("trade_id", tradeId).add("info_id", biz_info.biz_id);
		if (infoId.length() > 15) {
			infoId = infoId.substring(0, 15);
		}
		def chain2 = Chain.make("trade_id", infoId).add("order_no", tradeId);
		getChainsImport(chain1 ,chain2);
		transDao.insert("ti_inquiry", chain1);
		transDao.insert("tb_unionmodelinfo", chain2);
		transDao.clear("ti_shop_car", Cnd.where("cart_id", "=", tradeId));
	}

	protected void addAtom(Atom atom){
		if (atom == null) {
			return;
		}
		List<Atom> atoms = context.has("_trans_atoms")?context.get("_trans_atoms"): new ArrayList<Atom>();
		atoms.add(atom);
		if (!context.has("_trans_atoms")) {
			context.set("_trans_atoms", atoms);
		}
		println "事物数目：" + atoms.size();
	}

	private void _mergeContext(){
		println "进行相关合并操作！";
	}

	/*订单数据加工*/
	public void getChainsImport(Chain chain1 ,Chain chain2){
		def params = context.has("trade_params")? context.get("trade_params"):IMvcs.reqMap();
		def title ,content ="" ;

		title = "我参加 "+ defChandi(model_info, biz_info) + defPinpai(model_info, biz_info) + defXilie(model_info, biz_info)  + " 的联合商务组单";
		content = "1.品牌：" + defPinpai(model_info, biz_info) + " 系列:" + defXilie(model_info, biz_info) + "适用车型:" + (model_info.sycx?model_info.sycx:"") + "型号:" + model_info.specification + "(订购数量："+ data.num +") (原单价："+  data.price +") (实际单价:"+data.real_price +")";

		chain1.add("title", title).add("order_num", data.num).add("req_price", data.real_total);
		chain1.add("content", content).add("re_name", user_info.user_name).add("req_compname", user_info.cust_name);
		chain1.add("req_phone", user_info.user_tel).add("rsrv_str1", "1").add("rsrv_str2", "1").add("pay_path", "1");
		chain1.add("rsrv_str3", user_info.addr).add("cust_id", shop_info.cust_id).add("in_date", new Date()).add("user_id", user_info.user_id);
		chain1.add("remark", "").add("biz_type", data.biz_type).add("s_cust_id", shop_info.cust_id).add("receipt_type", data.receipt_type);
		chain1.add("receipt_facts", data.facts).add("optional_facts", data.facts).add("optional_names", "").add("real_price", data.real_price);
		chain1.add("model_remarks", model_info.ycbm).add("model_names", model_info.model_name).add("state_code", "1").add("real_cust_id", shop_info.cust_id);

		chain2.add("model_id", model_info.model_id).add("order_num", data.num).add("single_price", data.price).add("total_price", data.total);
		chain2.add("rsrv_str1", model_info.model_name).add("rsrv_str3", "").add("cust_id", user_info.cust_id).add("in_date", new Date()).add("user_id", user_info.user_id);
		chain2.add("s_cust_id", shop_info.cust_id).add("remark", "").add("receipt_type", data.receipt_type).add("receipt_facts", data.fact).add("real_price", data.real_price).add("optional_facts", "");
		chain2.add("optional_names", "");

	}

	private String defPinpai(model,biz){
		String pinpai = "";
		pinpai = Strings.sBlank(model.pinpai, biz.pinpai);
		pinpai = Strings.sBlank(pinpai, "");
		return pinpai;
	}

	private String defChandi(model,biz){
		String chandi = "";
		chandi = Strings.sBlank(model.chandi, biz.chandi);
		chandi = Strings.sBlank(chandi, "");
		return chandi;
	}

	private String defXilie(model,biz){
		String chandi = "";
		chandi = Strings.sBlank(model.xilie, biz.xilie);
		chandi = Strings.sBlank(chandi, "");
		return chandi;
	}
}