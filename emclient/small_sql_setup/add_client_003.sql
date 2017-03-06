CREATE TABLE "sym_node"(
    "node_id" VARCHAR NOT NULL PRIMARY KEY ,
    "node_group_id" VARCHAR NOT NULL,
    "external_id" VARCHAR NOT NULL,
    "sync_enabled" INTEGER DEFAULT 0,
    "sync_url" VARCHAR,
    "schema_version" VARCHAR,
    "symmetric_version" VARCHAR,
    "database_type" VARCHAR,
    "database_version" VARCHAR,
    "heartbeat_time" TIMESTAMP,
    "timezone_offset" VARCHAR,
    "batch_to_send_count" INTEGER DEFAULT 0,
    "batch_in_error_count" INTEGER DEFAULT 0,
    "created_at_node_id" VARCHAR,
    "deployment_type" VARCHAR
);

CREATE TABLE "sym_node_identity"(
    "node_id" VARCHAR NOT NULL PRIMARY KEY ,
    FOREIGN KEY ("node_id") REFERENCES "sym_node" ("node_id")
);

insert into sym_node (node_id,node_group_id,external_id,sync_enabled,sync_url,schema_version,symmetric_version,database_type,database_version,heartbeat_time,timezone_offset,batch_to_send_count,batch_in_error_count,created_at_node_id) 
 values ('003','store','003',1,null,null,null,null,null,current_timestamp,null,0,0,'000');

--insert into sym_node_security (node_id,node_password,registration_enabled,registration_time,initial_load_enabled,initial_load_time,created_at_node_id) 
 --values ('003','5d1c92bbacbe2edb9e1ca5dbb0e481',1,null,1,null,'000');

INSERT INTO "sym_node_identity" VALUES('003');
