insert into sym_node (node_id,node_group_id,external_id,sync_enabled,sync_url,schema_version,symmetric_version,database_type,database_version,heartbeat_time,timezone_offset,batch_to_send_count,batch_in_error_count,created_at_node_id) 
 values ('003','store','003',1,null,null,null,null,null,current_timestamp,null,0,0,'000');

insert into sym_node_security (node_id,node_password,registration_enabled,registration_time,initial_load_enabled,initial_load_time,created_at_node_id) 
 values ('003','5d1c92bbacbe2edb9e1ca5dbb0e481',1,null,1,null,'000');

