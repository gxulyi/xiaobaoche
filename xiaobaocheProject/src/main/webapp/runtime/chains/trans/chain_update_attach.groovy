import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.lang.Strings;

import com.dworker.datas.IDatas;
import com.dworker.xwwechat.chain.NewsTransChain;
import com.xwqp88.util.NumberUtil;

class chain_updata_attach extends NewsTransChain {
	@Override
	protected void prepare() {
		// TODO Auto-generated method stub
		super.prepare();
		if (context.has("attach_params")) {
			addAtom {
				def map = context.getMap("attach_params");
				map.in_date = new Date(System.currentTimeMillis());
				if (map.attach_id == null) {
					map.attach_id = NumberUtil.randomChar(15);
					map.put(".table", "ti_attach_news");
					Cnd cnd = Cnd.where("attach_root_id", "=", map.attach_root_id);
					if (map.file_type) {
						cnd.and("file_type", "=", map.file_type);
					}
					transDao.clear("ti_attach_news", cnd);
					transDao.insert(map);
					IDatas datas = IDatas.NEW("data_attach");
					datas.cleareCache(["attach_id": map.attach_id]);
					datas.cleareCache(["attach_id": map.attach_id, "file_type": Strings.sBlank(map.file_type, "0")]);
				} else {
					Cnd cnd = Cnd.NEW().limit(1);
					Chain chain = null;
					boolean upd = false;
					map.each {
						if (it.key == "attach_id") {
							cnd.and(it.key, "=", it.value);
							upd = true;
						} else {
							if (chain == null) {
								chain = Chain.make(it.key, it.value);
							} else {
								chain.add(it.key, it.value)
							}
						}
					}
					if (upd) {
						transDao.update("ti_attach_news", chain, cnd);
						IDatas datas = IDatas.NEW("data_attach");
						datas.cleareCache(["attach_id": map.attach_id]);
						datas.cleareCache(["attach_id": map.attach_id, "file_type": Strings.sBlank(map.file_type, "0")]);
					}
				}
			};
		}
	}

}