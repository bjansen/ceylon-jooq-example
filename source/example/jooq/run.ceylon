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

import org.jooq {
    SQLDialect,
    DatePart
}
import org.jooq.impl {
    DSL {
        currentTimestamp,
        timestampAdd
    }
}

shared void run() {

    value dsl = DSL.using(createDataSource(), SQLDialect.mysql);
    value actors = dsl.selectFrom(actor).limit(5).fetch();

    for (actor in actors) {
        print("Actor ``actor.firstName`` ``actor.lastName``");
    }

    value overdueRentals
        = dsl.select(
            concat(customer.lastName,
                   string(" "),
                   customer.firstName)
                .as("customer"),
            address.phone,
            film.title
        )
        .from(rental)
        .join(customer).on(rental.customerId.eq(customer.customerId))
        .join(address).on(customer.addressId.eq(address.addressId))
        .join(inventory).on(rental.inventoryId.eq(inventory.inventoryId))
        .join(film).on(inventory.filmId.eq(film.filmId))
        .where(rental.returnDate.isNull())
        .and(
        timestampAdd(rental.rentalDate, film.rentalDuration, DatePart.day)
            .lt(currentTimestamp())
    )
        .limit(5)
        .fetch();

    for (rental in overdueRentals) {
        print("Customer ``rental.value1()``, phone ``rental.value2()``,
                title ``rental.value3()``");
    }
}