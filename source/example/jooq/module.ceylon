native("jvm")
module example.jooq "1.0.0" {
    import gen.example.jooq "1.0.0";

    import "mysql:mysql-connector-java" "5.1.36";
    import "com.zaxxer:HikariCP-java6" "2.3.9";
    
    import ceylon.interop.java "1.1.1";
}
