# SQL Queries

# 1.Retrieve all patients first name in alphabetical order.
select first_name from patient
order by first_name;

# 2.Get patient names and phone numbers. 
select first_name,surname,phone
from patient;

# 3.List all physicians whose qualification is MD. 
select * from physician
where Qualification = 'MD';

# 4.Show all medical procedures with cost lesser than $500. 
select * from medical_procedure
where cost_usd < 500;

# 5.Find all nurses who joined after 2005. 
select * from nurse
where doj > '2005-12-31';

# 6.Count number of patients whose name starts with C
select count(*) as 'Total_patient' from patient
group by first_name
having first_name like 'C%';

# 7.Get all physicians along with their department name. 
select p.name as physcian, d.name as department
from physician p 
join department d on p.Emp_id=d.dept_id;

# 8.Retrieve all procedures done for each patient. 
select p.first_name, p.surname, mp.procedure_name
from patient p 
join medical_procedure mp on p.patient_id=mp.patient_id;

# 9.List of medical analysis reports with patient name.
select mar.identification,mar.prescription,p.first_name,p.surname
from medical_analysis_report mar
join patient p on mar.patient_id=p.patient_id;

# 10.Show each department with total number of physicians. 
select d.name, count(ph.emp_id) as Total_physicians
from department d 
left join physician ph on d.dept_id=ph.Emp_id
group by d.name;

# 11.Get each patient's assigned department (through checkup physician). 
select p.first_name,p.surname,d.name as department
from patient p 
left join physician ph on p.checkup_physician=ph.Emp_id 
left join department d on ph.dept_id=d.dept_id;

# 12.Find the most expensive procedure each physician performed.
select physician_id,procedure_name,cost_usd
from medical_procedure
where (physician_id,cost_usd) in (select
physician_id, max(cost_usd) 
from medical_procedure
group by physician_id);

# 13.Get patients whose procedure cost is above average. 
select procedure_name, cost_usd, patient_id, physician_id
from medical_procedure
where cost_usd > (select avg(cost_usd) from medical_procedure);


# 14.Show patients with procedure details and department of the physician who performed it.
select p.first_name, p.surname, mp.procedure_name,mp.cost_usd,
ph.name as physician_name,d.name as department
from medical_procedure mp
join patient p on mp.patient_id=p.patient_id
join physician ph on mp.physician_id=ph.emp_id
join department d on ph.dept_id=d.dept_id;
 
# 15.List each department with total patients treated under it (via physicians). 
select d.name as Department, count(distinct p.patient_id) as total_patients
from patient p
join physician ph on p.checkup_physician=ph.emp_id
join department d on ph.Dept_id=d.dept_id
group by d.name;

# 16.Find physicians who joined earlier than other physicians in the same department. 
select ph1.name as senior_physician,
ph2.name as junior_physician, d.name as department
from physician ph1
join physician ph2 on ph1.Dept_id=ph2.Dept_id
and ph1.Doj < ph2.Doj
join department d on d.Dept_id=ph1.dept_id;

# 17.Find patients who spent the most on procedures (TOP 5)
select p.first_name,p.surname,sum(mp.cost_usd)
from patient p 
join medical_procedure mp on p.patient_id=mp.patient_id
group by p.patient_id
order by cost_usd desc
limit 5;

# 18.Rank physicians by number of procedures performed. (TOP 5) 
select ph.name , count(mp.patient_id) as total_procedures
from physician ph 
join medical_procedure mp on mp.physician_id=ph.Emp_id
group by ph.Emp_id
order by 2 desc
limit 5;

# 19.Find the rank of each department based on total number of procedures performed. 
with dept_procedure as 
( select d.dept_id,
d.name as Department_name,
count(mp.patient_id) as total_procedure
from department d
join physician p on d.dept_id=p.Dept_id
join medical_procedure mp on p.Emp_id=mp.physician_id
group by d.dept_id,d.name
)
select department_name,total_procedure, 
rank() over (order by total_procedure desc) as dept_rank
from dept_procedure;

# 20.Count the number of distinct patients treated by each physician, then rank all physicians by patient volume. 
with physician_rank as 
( select physician_id,
count(distinct patient_id) as total_patients
from medical_procedure
group by physician_id
)
select physician_id,
total_patients, 
dense_rank() over ( order by total_patients desc) as rank_by_patient_volume
from physician_rank;









