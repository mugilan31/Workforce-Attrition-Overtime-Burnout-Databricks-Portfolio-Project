create or replace table workspace.default.gold_dept_attrition_summary as
select department,work_model , count(employee_id) as head_count, sum(is_attrited) as attrited_employees, round(sum(is_attrited)*100/count(*)) as attrition_rate_pct,
round(avg(overtime_hours)) as avg_overtime_hours, round(avg(monthly_salary_inr))
 as avg_monthly_salary_inr 
from workspace.default.silver_table
group by department,work_model;

CREATE OR REPLACE TABLE workspace.default.gold_burnout_matrix AS
SELECT overtime_risk_bond,promotion_stagnation_flag,COUNT(*) AS total_employees,SUM(is_attrited) AS attrited_employees,
ROUND(SUM(is_attrited) * 100.0 / COUNT(*), 2) AS attrition_rate_pct,
ROUND(AVG(overtime_hours), 1) AS avg_overtime_hours,
ROUND(AVG(monthly_salary_inr), 0) AS avg_monthly_salary
FROM workspace.default.silver_table GROUP BY overtime_risk_bond,promotion_stagnation_flag;


create or replace table workspace.default.gold_city_ranking as 
select city, count(*) as head_count, ROUND(SUM(is_attrited) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
from workspace.default.silver_table
group by city;

select * from workspace.default.gold_dept_attrition_summary;

