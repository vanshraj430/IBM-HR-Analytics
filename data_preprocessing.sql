select * from hr_ibm;

select count(*) from information_schema.columns where table_name='hr_ibm';

/*percentage of attrition */
select 
attrition,
count(*) as count,
round(count(*)*100.0/(select count(*) from hr_ibm),2) as percentage 
from hr_ibm
group by attrition;

/* Total employees count based on department*/
select department,count(*) as total_count_by_dept from hr_ibm group by department;

/* Average income for the department */
select department,round(avg(montly_income),0) as avg_sal from hr_ibm group by department order by avg_sal desc;

/* average income based on the different job roles */
select job_role,round(avg(montly_income),0) as avg_sal, max(montly_income) as max_sal,min(montly_income) as min_sal 
from hr_ibm group by job_role 
order by avg_sal desc;

/* The income range of employees as per their monthly income */
select 
	case 
		when montly_income >=10000 then 'high'
		when montly_income >=5000 and montly_income <=10000 then 'mid'
		else 'low' end as income_range,
	count(*) as count
from hr_ibm
group by income_range;

/* attrition by department */
select department,attrition, count(*) as count from hr_ibm group by attrition,department order by attrition desc;

/* attrition by age */
select
case when age<30 then 'below 30'
when age between 30 and 40 then '30 to 40'
when age between 41 and 50 then '41 to 50'
else 'above 50' end as age_group,
attrition,count(*) as count
from hr_ibm
group by attrition,age_group;

/* attrition by over time */
select over_time,attrition,count(*) as count from hr_ibm group by attrition,over_time;

/* attrition by job satisfacation */
select attrition,job_satisfacation,count(*) as count from hr_ibm 
group by  attrition,job_satisfacation
order by job_satisfacation;

/* attrition by work life balance */
select attrition,worklife_balance,count(*) as count from hr_ibm
group by attrition,worklife_balance
order by worklife_balance;