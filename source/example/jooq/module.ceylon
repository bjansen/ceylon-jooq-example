native("jvm")
module example.jooq "1.0.0" {
    import gen.example.jooq "1.0.0";

    import maven:mysql:"mysql-connector-java" "5.1.36";
    import maven:com.zaxxer:"HikariCP-java6" "2.3.9";
}
