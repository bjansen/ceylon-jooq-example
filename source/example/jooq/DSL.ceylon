import org.jooq.impl {
    DSL {
        fun=\ifunction,
        inline
    },
    DefaultDataType
}
import org.jooq {
    Field,
    DataType
}

DataType<String> stringType
        = DefaultDataType(null, `String`, "varchar");

Field<String> concat(Field<String>* fields)
        => fun("concat", `String`, *fields);

Field<String> string(String string)
        => inline(string, stringType);