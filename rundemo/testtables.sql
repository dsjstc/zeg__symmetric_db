PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "item"(
    "item_id" INTEGER NOT NULL PRIMARY KEY ,
    "name" VARCHAR
);
CREATE TABLE "item_selling_price"(
    "item_id" INTEGER NOT NULL,
    "store_id" VARCHAR NOT NULL,
    "price" DECIMAL NOT NULL,
    "cost" DECIMAL,
    PRIMARY KEY ("item_id", "store_id"),
    FOREIGN KEY ("item_id") REFERENCES "item" ("item_id")
);
CREATE TABLE "sale_transaction"(
    "tran_id" INTEGER NOT NULL PRIMARY KEY ,
    "store_id" VARCHAR NOT NULL,
    "workstation" VARCHAR NOT NULL,
    "day" VARCHAR NOT NULL,
    "seq" INTEGER NOT NULL
);
CREATE TABLE "sale_return_line_item"(
    "tran_id" INTEGER NOT NULL PRIMARY KEY ,
    "item_id" INTEGER NOT NULL,
    "price" DECIMAL NOT NULL,
    "quantity" INTEGER NOT NULL,
    "returned_quantity" INTEGER,
    FOREIGN KEY ("tran_id") REFERENCES "sale_transaction" ("tran_id"),
    FOREIGN KEY ("item_id") REFERENCES "item" ("item_id")
);
COMMIT;
