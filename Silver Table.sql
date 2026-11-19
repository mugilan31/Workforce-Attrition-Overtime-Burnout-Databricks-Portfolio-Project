Create or replace table workspace.default.silver_table as 
select distinct employee_id, initcap(trim(city)) as city, initcap(trim(work_mode)) as work_model, initcap(trim(department)) as department,
upper(trim(attrition_flag)) as attrition_flag, cast(hire_date as date) as hire_date, cast(exit_date as date) as exit_date, cast(monthly_salary_inr as double) as monthly_salary_inr,
cast(last_promotion_years as int) as last_promotion_years, cast(performance_rating as int) as performance_rating, 
ROUND(DATEDIFF(COALESCE(exit_date, CURRENT_DATE()), hire_date) / 365.25, 1) as tenure,
overtime_hours,
case when overtime_hours >= 20 then 'High burnout risk' 
     when overtime_hours >= 10 then 'Moderate' 
     else 'Normal' end as overtime_risk_bond,
case when last_promotion_years >= 2 then 'Stagnant 2 yrs' 
     else 'recent 2 yrs' end as promotion_stagnation_flag,
case when UPPER(TRIM(attrition_flag)) = 'YES' THEN 1 ELSE 0 END as is_attrited 
from workspace.default.bronze_table
where employee_id is not null and trim(employee_id) != ' ';


select * from workspace.default.silver_table;