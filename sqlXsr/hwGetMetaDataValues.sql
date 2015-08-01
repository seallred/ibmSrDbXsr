-- ----------------------------------------------------------------------------
-- Get Hardware Form Elements and mapping to ECI Records
-- ----------------------------------------------------------------------------

-- AIR ECI FIELDS
-- eci_msg_field_num in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 19, 32, 33, 35, 36, 40, 41, 76, 106, 133, 141, 145)

-- Get Front End Form Elements
select mdf.form_code as code, mde.meta_data_element_id as id, mde.eci_msg_type, mde.eci_msg_field_num as field#, 
       mde.default_form_label as default_label, mdfx.form_label label_override,
       case when length(coalesce(mdfx.form_label,'')) > 0 then mdfx.form_label else mde.default_form_label end as label,
--       mdfx.is_required as mdfx_required, mde.is_required as mde_required,
       case when mdfx.is_required is not null then mdfx.is_required else mde.is_required end as is_required,
       mde.db_entity || '.' || mde.db_attribute as database, mde.description
  from xsr.meta_data_form mdf
  	inner join xsr.meta_data_form_xref mdfx
  		on (mdf.meta_data_form_id = mdfx.meta_data_form_id)
  	inner join xsr.meta_data_element mde
  		on (mde.meta_data_element_id = mdfx.meta_data_element_id)
 where mdf.form_code = 'AIR'
 order by substr(mde.eci_msg_type,1,4) desc, mde.eci_msg_field_num;
 
 -- Get ECI Message Mapping
select mdf.form_code as code, mde.meta_data_element_id as id, 
       mde.eci_msg_type, mde.eci_msg_field_num as field#, mde.eci_msg_position as pos, mde.eci_msg_length as len,
       name, case  when length(coalesce(mdfx.form_label,'')) > 0 then mdfx.form_label else mde.default_form_label end as label,
       mde.db_entity || '.' || mde.db_attribute as database, mde.description
  from xsr.meta_data_form mdf
  	inner join xsr.meta_data_form_xref mdfx
  		on (mdf.meta_data_form_id = mdfx.meta_data_form_id)
  	inner join xsr.meta_data_element mde
  		on (mde.meta_data_element_id = mdfx.meta_data_element_id)
-- where mdf.form_code = 'AIR'
 order by substr(mde.eci_msg_type,1,4) desc, mde.eci_msg_field_num;
 
 
select mdf.form_code as code, mde.meta_data_element_id as id, 
       mde.eci_msg_type, mde.eci_msg_field_num as field#, mde.eci_msg_position as pos, mde.eci_msg_length as len,
       name, case  when length(coalesce(mdfx.form_label,'')) > 0 then mdfx.form_label else mde.default_form_label end as label,
       mde.db_entity || '.' || mde.db_attribute as database, mde.description
  from xsr.meta_data_form mdf
  	inner join xsr.meta_data_form_xref mdfx
  		on (mdf.meta_data_form_id = mdfx.meta_data_form_id)
  	inner join xsr.meta_data_element mde
  		on (mde.meta_data_element_id = mdfx.meta_data_element_id)
-- where mdf.form_code = 'AIR'
 order by substr(mde.eci_msg_type,1,4) desc, mde.eci_msg_field_num;
 
 

 
 -- Get ALl ECI Message Mapping regardless of Form Type
select mde.meta_data_element_id as id, 
       mde.eci_msg_type, mde.eci_msg_field_num as field#, mde.eci_msg_position as pos, mde.eci_msg_length as len,
       name, mde.default_form_label,
       mde.db_entity || '.' || mde.db_attribute as database, mde.description
  from xsr.meta_data_element mde
where mde.eci_msg_type like 'header%'  
order by substr(mde.eci_msg_type,1,4) desc, mde.eci_msg_field_num
with ur;




-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

 -- REPORT FOR MARK 
select * from xsr.meta_data_form;

 
 -- Header
select mde.eci_msg_type, mde.eci_msg_field_num as field#, mde.eci_msg_position as pos, mde.eci_msg_length as len,
       name, mde.default_form_label,
       mde.db_entity || '.' || mde.db_attribute as database, mde.description
  from xsr.meta_data_element mde
where mde.eci_msg_type like 'header%'  
order by substr(mde.eci_msg_type,1,4) desc, mde.eci_msg_field_num

-- Record Types
 select mde.meta_data_element_id as id, 
       mde.eci_msg_type, mde.eci_msg_field_num as field#, mde.eci_msg_position as pos, mde.eci_msg_length as len,
       name, mde.default_form_label,
       mde.db_entity || '.' || mde.db_attribute as database, mde.description
  from xsr.meta_data_element mde
 where mde.eci_msg_type like '000%'
order by substr(mde.eci_msg_type,1,4), mde.eci_msg_field_num;


