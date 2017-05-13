import com.mysql.cj.core.conf {
    PropertyDefinitions {
        serverTimezone=PNAME_serverTimezone
    }
}
import com.mysql.cj.jdbc {
    MysqlDataSource
}
import com.zaxxer.hikari {
    HikariDataSource,
    HikariConfig
}

import java.lang {
    JString=String
}

import javax.sql {
    DataSource
}

DataSource createDataSource() {

    //connection properties for MySQL
    value mysql = MysqlDataSource();
    mysql.databaseName = "sakila";
    mysql.user = "root";
    mysql.setPassword("");

    //work around a really lame bug in MySQL driver
    mysql.getModifiableProperty<JString>(serverTimezone)
         .setValue(JString("Australia/Sydney"));

    value config = HikariConfig();
    config.dataSource = mysql;
    return HikariDataSource(config);
}
