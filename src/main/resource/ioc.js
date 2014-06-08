var ioc = {
		
		
    // 数据源
    dataSource : {
        type :"com.alibaba.druid.pool.DruidDataSource",
        events : {
            depose :"close"
        },
        fields : {
            driverClassName : "org.h2.Driver",
            url             : "jdbc:h2:h2db/nlpchina",
            username        : "sa",
            password        : "",
            initialSize     : 10,
            maxActive       : 100,
            testOnReturn    : true,
            validationQuery : "select 1"
        }
    },
    // Dao
    dao : {
        type :'org.nutz.dao.impl.NutDao',
        args : [ {refer :"dataSource"}]
    }

};
