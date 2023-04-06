import com.xwqp88.shop.core.chain.ShopChain;
import com.xwqp88.shop.util.IShops;

class chain_params_setting extends ShopChain{
	@Override
	protected void prepare() {
		// TODO Auto-generated method stub
		super.prepare();
		if (IShops.isLogin()) {
			context.set("params_setting", IShops.getUser());
		}
	}

}