import org.nutz.dao.Cnd
import org.nutz.dao.Dao

import com.dworker.xwwechat.datas.NewsDataSource
import com.xwqp88.dao.IDaos

class data_attach extends NewsDataSource {
	public <T> T get(Object params) {
		def area = [];
		Dao dao = IDaos.getDao(XW_DF_DS);
		Cnd cnd = Cnd.NEW();
		int pn = 1, ps = 20;
		String orb = "in_date", orbAsc = "asc";
		params.each {
			if (it.key != "name") {
				if (it.key == "page" || it.key == "pageNo") {
					pn = Integer.parseInt(String.valueOf(it.value));
				} else if(it.key == "rows" || it.key == "pageSize"){
					ps = Integer.parseInt(String.valueOf(it.value));
				} else if(it.key == "attach_name"){
					cnd.and(it.key, "like", "%" + it.value + "%");
				} else {
					cnd.and(it.key, "=", it.value);
				}
			}
		}
		cnd.limit(pn, ps).orderBy(orb, orbAsc);
		int total = 0;
		try {
			area = dao.query("ti_attach_news", cnd);
			if (area != null && area.size() == ps) {
				total = dao.count("ti_attach_news", cnd);
			} else {
			    total = area == null? 0: area.size();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ["rows": area, "total": total];
	}
}