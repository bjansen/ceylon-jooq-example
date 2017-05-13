native("jvm")
module example.jooq "1.0.0" {
    import gen.example.jooq "1.0.0";

    import maven:mysql:"mysql-connector-java" "6.0.6";
    import maven:com.zaxxer:"HikariCP" "2.6.1";

    import java.base "8";
}
