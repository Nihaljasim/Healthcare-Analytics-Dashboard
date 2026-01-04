create database Health_care;

use health_care;

show tables;

select * from patient;
select * from doctor;
select * from visit;
select * from lab_test;
select * from treatment;


-- Total Patients
select count(patient_id) as Total_Patients
from patient;

-- Total Doctors
select count(doctor_id) as Total_Doctors
from doctor;

-- Total visits
select count(visit_id) as Total_visits
from visit;

-- Average age of the patients
select round(avg(age),2) as Avg_patient_age
from patient;

-- Top 5 Diagonsed condition
select Diagnosis,count(patient_id) as Diagnosis_count
from visit
group by Diagnosis
order by  Diagnosis_count desc
limit 5;

-- Follow up rate
select round(sum(case when follow_up_required = "yes" then 1
else 0 end)/count(visit_id)*100,2
) as Follow_up_rate
from visit;

-- Average Treatment cost per visit
SELECT CONCAT('$ ', FORMAT(AVG(treatment_cost), 2)) AS avg_treatment_cost
FROM treatment;

-- Total lab test conducted
select count(lab_result_id) as Total_lab_test
from lab_test
where test_result is not null;

-- Percentage of abnormal result
select
round(sum(case when test_result = "abnormal" then 1 else 0 end)
/count(visit_id)*100,2
) as Abnormal_lab_percent
from lab_test;

--  Top 10 Doctor Workload by Department
select d.department,d.doctor_name,count(v.patient_id) as no_of_visit
from doctor d
inner join visit v
on d.doctor_id=v.doctor_id
group by d.department,d.doctor_name
order by no_of_visit desc
limit 10;

-- Age group by Total patients
select age_group,count(patient_id) as Patients
from patient
group by age_group;


