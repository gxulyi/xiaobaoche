import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.mvc.Mvcs;
import org.nutz.trans.Atom;

import com.dworker.chains.IChains;
import com.dworker.chains.core.IChainContext;
import com.dworker.chains.core.impl.SimpleChainContext;
import com.dworker.gvy.lang.GvmLoaders;
import com.dworker.web.chain.TransChain;
import com.xwqp88.mvc.IMvcs;
import com.xwqp88.shop.core.chain.ShopChain;
import com.xwqp88.shop.core.chain.ShopTransChain;

/**
 * 订单提交
 * @author Administrator
 *
 */
class chain_trans_commit_order extends ShopTransChain {
	def model_info;
	def biz_info;
	def shop_info;
	def user_info;
	def msg;
	def id, data;

	@Override
	protected void prepare() {
		super.prepare();
		def params = IMvcs.reqMap();

		/*进行算费操作*/
		data = Mvcs.getReq().getAttribute("__order_data");

		model_info = data.model_info;
		biz_info = data.biz_info;
		shop_info = data.shop_info;
		user_info = data.user_info;

		addAtom(new Atom(){
					public void run() {
						String s = null;
						Sql sql = null;
						transDao.clear("tb_order_record", Cnd.where("root_id", "=", model_info.model_id))
						s = "insert into tb_order_record(root_id, type, order_nums, total_money, edit_date, cust_id) values(@root_id, '0', (select SUM(order_num) from tb_unionmodelinfo where model_id = @root_id), (select SUM(total_price) from tb_unionmodelinfo where model_id = @root_id),@edit_date, @cust_id)";
						sql = Sqls.create(s)
						sql.params().set("edit_date", new Date());
						sql.params().set("root_id", model_info.model_id);
						sql.params().set("cust_id", model_info.cust_id);
						transDao.execute(sql);
					}
				}
				);
			nextChain("chain_trans_model")
	}
}