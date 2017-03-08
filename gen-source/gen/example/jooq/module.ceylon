native("jvm")
module gen.example.jooq "1.0.0" {
    shared import example.jooqconverters "1.0.0";
    
    import java.jdbc "8";
    import javax.annotation "8";
    import ceylon.interop.java "1.3.2";
}
