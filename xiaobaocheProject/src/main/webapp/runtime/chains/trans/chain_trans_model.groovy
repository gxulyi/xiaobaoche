import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.mvc.Mvcs;
import org.nutz.trans.Atom;

import com.xwqp88.mvc.IMvcs;
import com.xwqp88.shop.core.chain.ShopTransChain;

class chain_trans_model extends ShopTransChain {
	def model_info;
	def biz_info;
	def shop_info;
	def user_info;
	def msg;
	def id, data;
	@Override
	protected void prepare() {
		// TODO Auto-generated method stub
		super.prepare();
		def params = IMvcs.reqMap();

		/*进行算费操作*/
		data = Mvcs.getReq().getAttribute("__order_data");

		context.set("order_data", data);
		model_info = data.model_info;
		biz_info = data.biz_info;
		shop_info = data.shop_info;
		user_info = data.user_info;
		addAtom(new Atom(){
					public void run() {
						String s = null;
						Sql sql = null;
						s = "update ti_normal_biz_model set order_nums = (select SUM(order_num) from tb_unionmodelinfo where model_id = @root_id), order_total_money = (select SUM(total_price) from tb_unionmodelinfo where model_id = @root_id) where model_id = @root_id";
						sql = Sqls.create(s)
						sql.params().set("root_id", model_info.model_id);
						transDao.execute(sql);
					}
				})
	}
}