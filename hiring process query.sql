select * from employees_staging;

/** A. Hiring Analysis **/
select event_name as gender,
	count(*) as total_hires
from employees_staging
where status = 'hired'
group by event_name;

/** B. Salary Analysis **/
select avg(offered_salary) as average_salary
from employees_staging
where Status = 'hired';

/** C. Salary Distribution **/
select
	case
		when offered_salary between 0 and 50000 then '0 - 50K'
        when offered_salary between 50001 and 100000 then '50K - 100000'
        when offered_salary between 100001 and 150000 then '100000 - 150000'
        when offered_salary between 150001 and 200000 then '150000 - 200000'
        when offered_salary > 200000 then '200000 + '
	end as salary_range,
    count(*) as employees_count
from employees_staging
where Status = 'hired'
group by salary_range
order by min(Offered_Salary);

/** D. Department Analysis **/
select department,
			count(*) as total_employees,
            Round((count(*)*100.0/(select count(*) from employees_staging)),2) as percentage
from employees_staging
where status = 'hired'
group by Department
order by total_employees desc;

/** E. Position Tier Analysis **/
select post_name as Position_tier,
	count(*) as total_employees,
    round((count(*)*100.0/(select count(*) from employees_staging)),2) as percentage
from employees_staging
where status = 'hired'
group by Post_Name
order by total_employees desc;    