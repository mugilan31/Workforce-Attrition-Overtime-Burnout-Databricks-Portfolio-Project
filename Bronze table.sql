create or replace table workspace.default.bronze_table as
select *, _metadata.file_name as source_name, current_timestamp() as current_time 
from read_files('/Volumes/workspace/default/raw_files/workforce.csv',
format => 'CSV' , header => True);


select * from workspace.default.bronze_table;
