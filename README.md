Enterprise Workforce Attrition & Overtime Burnout — Databricks Portfolio Project

Business Problem Statement

Enterprise leadership has observed an elevated annual employee attrition rate (~20%) across its Indian delivery hubs (Chennai, Bengaluru, Hyderabad, Pune, and Gurugram). HR leadership needs an automated Lakehouse pipeline to unify raw HRIS exports, resolve data quality defects, and identify which departments, work modes, overtime thresholds, and promotion delays are driving voluntary exits—so managers can target retention interventions before burnout leads to resignation.

Dataset Overview (workforce_attrition_raw.csv)

Raw Records: 1,240 rows (1,200 unique valid employees + 40 intentional data defects)

Columns: employee_id, full_name, city, department, job_role, work_mode, hire_date, exit_date, last_promotion_years, monthly_salary_inr, overtime_hours, performance_rating, attrition_flag

Intentional Raw Data Defects (to fix in Silver):

25 duplicate employee records

10 blank / space-only employee_id rows

5 invalid negative or zero monthly_salary_inr rows

~180 rows with leading/trailing spaces or inconsistent casing in city, department, and work_mode

~45 rows with blank overtime_hours and blank exit_date for active employees
