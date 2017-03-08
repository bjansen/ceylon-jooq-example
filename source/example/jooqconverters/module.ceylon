native("jvm")
module example.jooqconverters "1.0.0" {
    shared import maven:"org.jooq":"jooq" "3.9.1";
    shared import maven:"org.jooq":"jooq-meta" "3.9.1";
    shared import maven:"org.jooq":"jooq-codegen" "3.9.1";
    
    shared import java.base "8";
    import ceylon.interop.java "1.3.2";
}
