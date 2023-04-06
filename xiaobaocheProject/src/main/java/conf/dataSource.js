var ioc = {
	dataSource : {
		type : "com.alibaba.druid.pool.DruidDataSource",
		events : {
			depose : "close"
		},
		fields : {
			driverClassName : "com.mysql.jdbc.Driver",
			url : "jdbc:mysql://localhost:3306/xwwx_wx?useUnicode=true&useOldAliasMetadataBehavior=true",
			username : "root",
			password : "root",
			minIdle : 1,
			maxIdle : 100,
			initialSize : 1,
			maxActive : 100,
			maxWait : 30000,
			minEvictableIdleTimeMillis: 1000,
			timeBetweenEvictionRunsMillis: 60000,
			minEvictableIdleTimeMillis: 300000,
			removeAbandonedTimeout: 30,
			validationQuery: "SELECT 'x'",
			poolPreparedStatements: true,
			maxPoolPreparedStatementPerConnectionSize: 30,
			filters: "stat,log4j"
		}
	},
	dao : {
		type : "org.nutz.dao.impl.NutDao",
		args : [ {
			refer : 'dataSource'
		} ]
	}

}