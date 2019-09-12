ALTER TABLE genatt_entry CHANGE COLUMN is_shown_in_completeness used_in_correct_form_response SMALLINT DEFAULT '0';

UPDATE genatt_field f SET f.CODE = 'default_date_value'
WHERE f.id_entry IN  (
SELECT e.id_entry FROM genatt_entry e
INNER JOIN genatt_entry_type t ON t.id_type = e.id_type
WHERE t.class_name = 'forms.entryTypeDate'
AND e.id_entry = f.id_entry);

UPDATE genatt_field f SET f.CODE = f.title
WHERE f.id_entry IN  (
SELECT e.id_entry FROM genatt_entry e
INNER JOIN genatt_entry_type t ON t.id_type = e.id_type
WHERE t.class_name = 'forms.entryTypeGeolocation'
AND e.id_entry = f.id_entry);

UPDATE genatt_field f SET f.title = null
WHERE f.id_entry IN  (
SELECT e.id_entry FROM genatt_entry e
INNER JOIN genatt_entry_type t ON t.id_type = e.id_type
WHERE t.class_name = 'forms.entryTypeGeolocation'
AND e.id_entry = f.id_entry);