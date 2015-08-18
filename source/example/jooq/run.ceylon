import org.jooq.impl {
    DSL {
        concat,
        currentTimestamp,
        timestampAdd,
        val
    }
}
import org.jooq {
    SQLDialect,
    Result,
    DatePart
}
import gen.example.jooq.tables {
    Actor {
        actor
    },
    Customer {
        customer
    },
    Address {
        address
    },
    Film {
        film 
    },
    Rental {
        rental 
    },
    Inventory {
        inventory
    }
}
import gen.example.jooq.tables.records {
    ActorRecord
}
import ceylon.interop.java {
    CeylonIterable,
    javaString
}

"Run the module `example.jooq`."
shared void run() {
    dataSource.setup();
    
    value dsl = DSL.using(dataSource, SQLDialect.\iMYSQL);
    
    Result<ActorRecord> actors = dsl.selectFrom(actor).limit(5).fetch();
    
    for (actor in CeylonIterable(actors)) {
        print("Actor ``actor.firstName`` ``actor.lastName``");
    }
    
    value overdueRentals = dsl.select(
            concat(customer.lastName, 
                   val(" "),
                   customer.firstName).as("customer"),
            address.phone, film.title
        )
        .from(rental)
        .join(customer).on(rental.customerId.eq(customer.customerId))
        .join(address).on(customer.addressId.eq(address.addressId))
        .join(inventory).on(rental.inventoryId.eq(inventory.inventoryId))
        .join(film).on(inventory.filmId.eq(film.filmId))
        .where(rental.returnDate.isNull())
        .and(
            timestampAdd(rental.rentalDate, film.rentalDuration, DatePart.\iDAY)
            .lt(currentTimestamp())
        )
        .limit(5)
        .fetch();
    
    for (rental in CeylonIterable(overdueRentals)) {
        print("Customer ``rental.value1()``, phone ``rental.value2()``,
                title ``rental.value3()``");
    }
}