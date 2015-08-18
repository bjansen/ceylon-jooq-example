native("jvm")
module example.jooqconverters "1.0.0" {
    shared import "org.jooq:jooq" "3.6.0";
    shared import "org.jooq:jooq-meta" "3.6.0";
    shared import "org.jooq:jooq-codegen" "3.6.0";
    
    shared import java.base "8";
    import ceylon.interop.java "1.1.1";
}
