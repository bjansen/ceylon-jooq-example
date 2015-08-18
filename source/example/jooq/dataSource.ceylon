import com.zaxxer.hikari {
    HikariDataSource
}
import com.mysql.jdbc.jdbc2.optional {
    MysqlDataSource
}

object dataSource extends HikariDataSource() {
    
    shared void setup() {
        value mysqlDS = MysqlDataSource();
        mysqlDS.databaseName = "sakila";
        mysqlDS.user = "root";
        mysqlDS.setPassword("");
        
        dataSource = mysqlDS;
    }
}