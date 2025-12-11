create database healthcare_system;

use healthcare_system;

# Create table Physician
CREATE TABLE Physician(
emp_id int primary key,
name varchar(150) not null,
Qualification varchar(150) not null,
dept_id int not null,
emergency_contact_number int not null,
doj date not null,
foreign key(dept_id) references department (dept_id)
);
alter table physician
drop emergency_contact_number;

# create department table
create table department(
dept_id int primary key,
name varchar(150) not null
);

# Enter values into physician table
insert into physician(emp_id,name,qualification,dept_id,doj)
values
(1,'Dr.Noah','MBBS_MS-ENT',5,'1996-02-22'),
(2,'Dr.John','MBBS',1,'2002-10-12'),
(3,'Dr.Oliva','MD',2,'2000-08-25'),
(4,'Dr.Emma','MS',8,'1999-07-06'),
(5,'Dr.Alex','MBBS',12,'1999-11-05'),
(6,'Dr.Divya','MCh',11,'2005-02-12'),
(7,'Dr.Ramya','DM',7,'2012-10-17'),
(8,'Dr.Arjun','DM',4,'2015-04-18'),
(9,'Dr.Aarav','MBBS',6,'2003-03-11'),
(10,'Dr.Sophia','MD',3,'2005-01-29'),
(11,'Dr.Mike','MBBS',10,'1998-08-10'),
(12,'Dr.Samuel','MBBS',9,'2007-11-04'),
(13,'Dr.Richard','MS',3,'2006-10-27'),
(14,'Dr.Dave','MD',2,'2000-02-05'),
(15,'Dr.Monika','MBBS',11,'2008-05-09'),
(16,'Dr.Jenifer','MD',1,'2001-03-12'),
(17,'Dr.Thomas','MBBS',7,'2004-08-15'),
(18,'Dr.Paul','MCh',8,'2012-09-17'),
(19,'Dr.David','MBBS',9,'2014-09-11'),
(20,'Dr.Joseph','MS',12,'2010-05-20');

# Enter values into department table
insert into department(dept_id,name)
values
(1,'General Surgery'),
(2,'Cardiology'),
(3,'Neurology'),
(4,'Pulmonology'),
(5,'ENT'),
(6,'Orthopedics'),
(7,'Gastroenterology'),
(8,'Nephrology'),
(9,'Oncology'),
(10,'Psychiatry'),
(11,'Gynecology'),
(12,'Urology');


# Create nurse table
CREATE TABLE nurse(
nurse_id INT NOT NULL ,
name VARCHAR(150) NOT NULL,
position VARCHAR(150) NOT NULL,
doj date not null);

# Enter values into nurse table
insert into nurse (nurse_id,name,position,doj)
values
(1, 'Aditi Sharma', 'Registered Nurse', '1998-04-12'),
(2, 'Sophia Johnson', 'Assistant Nurse', '2005-11-23'),
(3, 'Priya Nair', 'Staff Nurse', '2001-07-09'),
(4, 'Olivia Brown', 'Head Nurse', '2010-02-14'),
(5, 'Kavya Reddy', 'Nurse Anesthetist', '2003-09-28'),
(6, 'Mia Anderson', 'Supervisor Nurse', '2012-06-05'),
(7, 'Ananya Gupta', 'Cardiac Care Unit Nurse', '1999-12-03'),
(8, 'Emma Davis', 'Registered Nurse', '2008-08-19'),
(9, 'Harper Walker', 'Staff Nurse', '2006-03-22'),
(10, 'Lakshmi Iyer', 'Assistant Nurse', '1997-10-17'),
(11, 'Sneha Patil', 'Head Nurse', '2013-05-30'),
(12, 'Evelyn Martin', 'Registered Nurse', '2000-11-08'),
(13, 'Riya Mehra', 'Supervisor Nurse', '2004-04-26'),
(14, 'Saanvi Verma', 'Staff Nurse', '1996-12-15'),
(15, 'Aisha Khan', 'Nurse Anesthetist', '2009-07-01'),
(16, 'Charlotte Thomas', 'Cardiac Care Unit Nurse', '2002-01-20'),
(17, 'Nisha Pillai', 'Assistant Nurse', '2014-09-11'),
(18, 'Amelia White', 'Registered Nurse', '1998-03-06'),
(19, 'Meera Joshi', 'Supervisor Nurse', '2007-05-13'),
(20, 'Isabella Taylor', 'Head Nurse', '2011-08-29'),
(21, 'Pooja Sinha', 'Staff Nurse', '1999-06-18'),
(22, 'Chloe Allen', 'Cardiac Care Unit Nurse', '2005-02-10'),
(23, 'Neha Kulkarni', 'Registered Nurse', '2001-09-24'),
(24, 'Radhika Desai', 'Assistant Nurse', '2003-12-07'),
(25, 'Lily Green', 'Nurse Anesthetist', '2000-01-30'),
(26, 'Aaradhya Menon', 'Staff Nurse', '1997-05-21'),
(27, 'Stella Gonzalez', 'Supervisor Nurse', '2015-03-12'),
(28, 'Shruti Rao', 'Registered Nurse', '2012-11-02'),
(29, 'Nandini Shetty', 'Assistant Nurse', '1996-08-25'),
(30, 'Lucy Nelson', 'Cardiac Care Unit Nurse', '2004-10-14'),
(31, 'Myra Fernandez', 'Head Nurse', '2009-01-18'),
(32, 'Tanvi Nair', 'Registered Nurse', '2013-07-27');

# To update table with only first name
update nurse
set name = substring_index(name, ' ', 1);

# create Patient Table
create table Patient(
patient_id INT Primary key auto_increment,
name varchar(150) not null,
address varchar(150) not null,
Gender varchar(150) not null,
phone varchar(150) not null,
checkup_physician int not null,
FOREIGN KEY(checkup_physician) REFERENCES Physician(emp_id)
);

# Enter values into patient table
insert into patient (Patient_id,name,address,Gender,phone,checkup_physician)
values
(1, 'Rahul Mehta', '1420 Maple St, Dallas, TX', 'Male', '+1-469-221-7834',4),
(2, 'Ethan Wright', '58 Lakeview Dr, Orlando, FL', 'Male', '+1-321-555-1274',9),
(3, 'Aarav Kapoor', '230 Willow Ln, Seattle, WA', 'Male', '+1-206-914-6632',5),
(4, 'Chloe Turner', '790 Redwood Ave, Fresno, CA', 'Female', '+1-559-884-2109',7),
(5, 'Ishika Desai', '912 Park Blvd, Phoenix, AZ', 'Female', '+1-602-423-9088',1),
(6, 'Logan Adams', '445 Creekside Rd, Denver, CO', 'Male', '+1-303-772-1190',12),
(7, 'Maya Bansal', '77 Spring St, Newark, NJ', 'Female', '+1-973-314-5222',11),
(8, 'Sebastian Miller', '101 Harbor Dr, San Diego, CA', 'Male', '+1-619-855-3371',2),
(9, 'Anika Reddy', '209 Garden Ave, Portland, OR', 'Female', '+1-503-319-9872',5),
(10, 'Noah Reed', '312 Pinecrest Ln, Atlanta, GA', 'Male', '+1-678-910-4521',3),
(11, 'Kabir Sinha', '880 Hilltop Rd, Charlotte, NC', 'Male', '+1-704-221-7644',8),
(12, 'Liam Parker', '672 Beacon St, Boston, MA', 'Male', '+1-617-561-7725',6),
(13, 'Sara Khan', '933 Oakridge Cir, Chicago, IL', 'Female', '+1-312-744-9100',10),
(14, 'Harper Collins', '540 Meadow Ln, Columbus, OH', 'Female', '+1-614-319-5783',1),
(15, 'Vikram Joshi', '120 Brookside Dr, Detroit, MI', 'Male', '+1-313-882-9912',9),
(16, 'Ava Mitchell', '660 Valley View St, Miami, FL', 'Female', '+1-786-557-4420',4),
(17, 'Rohan Nair', '77 Westwood Ave, Houston, TX', 'Male', '+1-713-991-2342',8),
(18, 'Zoey Bennett', '304 Sunset Blvd, Los Angeles, CA', 'Female', '+1-424-563-7781',10),
(19, 'Dev Malhotra', '25 Highland Rd, Kansas City, MO', 'Male', '+1-816-990-4411',1),
(20, 'Ella Howard', '98 Riverside Dr, Sacramento, CA', 'Female', '+1-530-211-6629',3),
(21, 'Krish Patel', '482 Sycamore St, Memphis, TN', 'Male', '+1-901-761-2301',5),
(22, 'Natalie Brooks', '211 Aspen Ct, Omaha, NE', 'Female', '+1-402-665-5524',4),
(23, 'Tanish Arora', '903 Ridgewood Ln, Salt Lake City, UT', 'Male', '+1-385-220-8473',2),
(24, 'Madison Clark', '341 Elmwood Ave, Buffalo, NY', 'Female', '+1-716-298-5527',9),
(25, 'Dhruv Mishra', '889 Glen Dr, Minneapolis, MN', 'Male', '+1-612-490-7764',12),
(26, 'Lily Foster', '640 Orchard Rd, Boise, ID', 'Female', '+1-208-665-1983',11),
(27, 'Ayaan Gupta', '755 Birchwood St, Tulsa, OK', 'Male', '+1-918-740-6532',6),
(28, 'Scarlett Rivera', '441 Maple Grove Rd, Richmond, VA', 'Female', '+1-804-992-8104',10),
(29, 'Nikhil Raj', '522 Hillcrest Ave, Louisville, KY', 'Male', '+1-502-882-2118',7),
(30, 'Victoria Price', '12 Meadowbrook Dr, Raleigh, NC', 'Female', '+1-919-442-9915',7),
(31, 'Yash Menon', '333 Autumn St, Milwaukee, WI', 'Male', '+1-414-661-2050',4),
(32, 'Grace Edwards', '210 Woodland Ave, Tampa, FL', 'Female', '+1-813-512-8832',6),
(33, 'Siddharth Verma', '867 Forest Ln, Indianapolis, IN', 'Male', '+1-317-441-6003',5),
(34, 'Aria Moore', '708 Lakefront Cir, Cleveland, OH', 'Female', '+1-216-740-5521',5),
(35, 'Imran Sheikh', '661 Cedar St, Pittsburgh, PA', 'Male', '+1-412-991-7134',1),
(36, 'Hazel Simmons', '555 Harbor Park Rd, Seattle, WA', 'Female', '+1-206-557-4408',1),
(37, 'Farhan Qureshi', '902 Creek Dr, St. Louis, MO', 'Male', '+1-314-773-5644',6),
(38, 'Bella Knight', '199 Rosewood Ave, Denver, CO', 'Female', '+1-720-660-2994',8),
(39, 'Jayant Chawla', '111 Kingsway St, Phoenix, AZ', 'Male', '+1-480-712-6650',6),
(40, 'Aaliyah Barnes', '392 Prospect Rd, Las Vegas, NV', 'Female', '+1-702-903-4420',2),
(41, 'Parth Shukla', '288 Sunset View Rd, Austin, TX', 'Male', '+1-512-641-2201',3),
(42, 'Julia Evans', '90 Lexington Rd, Philadelphia, PA', 'Female', '+1-215-772-8834',2),
(43, 'Rudra Chatterjee', '732 Bridgeway Dr, San Jose, CA', 'Male', '+1-408-212-9982',5),
(44, 'Paisley Scott', '478 Sunrise Blvd, Honolulu, HI', 'Female', '+1-808-993-5518',7),
(45, 'Aman Sehgal', '50 Highland Park St, Portland, ME', 'Male', '+1-207-990-2240',4),
(46, 'Leah Cooper', '643 Crestwood Ln, Chicago, IL', 'Female', '+1-872-210-4418',9),
(47, 'Vivaan Garg', '870 Greenfield Rd, Nashville, TN', 'Male', '+1-629-212-4477',8),
(48, 'Stella Morris', '501 North Point Ave, San Francisco, CA', 'Female', '+1-415-553-9912',7),
(49, 'Kunal Bhatt', '282 Cedarwood Ln, New York, NY', 'Male', '+1-917-662-5511',7),
(50, 'Zoe Murphy', '144 Parkland Dr, Orlando, FL', 'Female', '+1-407-305-6627',1);



# To split name into first name & surname
alter table patient
add column surname varchar(50) after name;
update patient
set 
    surname = substring_index(name, ' ', -1),
    name = substring_index(name, ' ', 1);

# Create Medical Analysis Report

create table medical_analysis_report( 
identification varchar(100) not null,
prescription varchar(100) not null,
patient_id int not null,
physician_id int not null,
foreign key (patient_id) references patient(patient_id),
foreign key (physician_id) references physician(emp_id)
);

# Enter values medical_analysis_report into table
insert into medical_analysis_report(identification,prescription,patient_id,physician_id)
values
('COPD', 'Bronchodilators', 1, 8),
('Tumor Screening', 'Follow-up Tests', 2, 19),
('Sinusitis', 'Antibiotics', 3, 1),
('Gastritis', 'Antacids', 4, 7),
('Abdominal Pain', 'Buscopan', 5, 2),
('Kidney Stones', 'ibuprofen', 6, 5),
('PCOS', 'Hormonal Therapy', 7, 6),
('Hypertension', 'Beta Blockers', 8, 3),
('Sinusitis', 'Antibiotics', 9, 1),
('Migraine', 'Analgesics', 10, 10),
('Kidney Infection', 'Cefalexin', 11, 18),
('Joint Pain', 'Calcium Supplements', 12, 9),
('Anxiety', 'SSRIs', 13, 11),
('Abdominal Pain', 'Omeprazole', 14, 16),
('Tumor Screening', 'Follow-up Tests', 15, 12),
('Asthma', 'Singulair', 16, 8),
('Kidney Infection', 'Antibiotics', 17, 4),
('Anxiety', 'SSRIs', 18, 11),
('IBS', 'rifaximin', 19, 2),
('Migraine', 'Analgesics', 20, 13),
('Epistaxis', 'LET', 21, 1),
('Asthma', 'Inhaler', 22, 8),
('Hypertension', 'Beta Blockers', 23, 3),
('Tumor Screening', 'Follow-up Tests', 24, 19),
('Kidney Stones', 'Pain Reliever', 25, 20),
('PCOS', 'Hormonal Therapy', 26, 15),
('Joint Pain', 'Calcium Supplements', 27, 9),
('Anxiety', 'SSRIs', 28, 11),
('Diarrhea', 'Alosetron', 29, 17),
('Gastritis', 'Antacids', 30, 17),
('Wheezing', 'Albuterol', 31, 8),
('Joint Pain', 'Calcium Supplements', 32, 9),
('Otosclerosis', 'Bisphosphonates', 33, 1),
('CAD', 'Aspirin', 34, 14),
('Viral Fever', 'Paracetamol', 35, 2),
('Abdominal Pain', 'Painkillers', 36, 16),
('Arthritis', 'Naproxen', 37, 9),
('Prostate Infection', 'Ciprofloxacin', 38, 18),
('Joint Pain', 'Calcium Supplements', 39, 9),
('Arrhythmia', 'Beta blockers', 40, 3),
('Migraine', 'Analgesics', 41, 10),
('Hypertension', 'Beta Blockers', 42, 14),
('Anosmia', 'Corticosteroids', 43, 1),
('Gastritis', 'Antacids', 44, 7),
('Asthma', 'Inhaler', 45, 8),
('Tumor Screening', 'Follow-up Tests', 46, 19),
('Kidney Infection', 'Antibiotics', 47, 4),
('Constipation', 'Lubiprostone', 48, 17),
('Diarrhea', 'Alosetron', 49, 7),
('Abdominal Pain', 'Painkillers', 50, 2);

create table medical_procedure( 
patient_id int primary key not null,
physician_id int not null,
procedure_name varchar(100) not null,
cost_usd decimal(10,2) not null,
foreign key (patient_id) references patient(patient_id),
foreign key (physician_id) references physician(emp_id)
);

RENAME TABLE medical__procedure TO medical_procedure;

insert into medical__procedure(patient_id,physician_id,procedure_name,cost_usd)
values
(1,8,'Spirometry',360.00),
(2,19,'CT Scan',700.00),
(3,1,'Nasal Endoscopy',400.00),
(4,7,'Biopsy',1500.00),
(5,2,'Ultra Sound',900.00),
(6,5,'CT Scan',1000.00),
(7,6,'Ultra Sound',800.00),
(8,3,'Blood pressure test',200.00),
(9,1,'Nasal Endoscopy',400.00),
(10,10,'MRI',500.00),
(11,18,'Urine test',100.00),
(12,9,'X-Ray',350.00),
(13,11,'GAD-7',450.00),
(14,16,'Endoscopy',840.00),
(15,12,'CT Scan',700.00),
(16,8,'Nasal Endoscopy',400.00),
(17,4,'Urine test',100.00),
(18,11,'GAD-7',450.00),
(19,2,'Blood Test',250.00),
(20,13,'MRI',500.00),
(21,1,'Blood Test',250.00),
(22,8,'Nasal Endoscopy',400.00),
(23,3,'Blood pressure test',200.00),
(24,19,'CT Scan',700.00),
(25,20,'Urine test',100.00),
(26,15,'Ultra Sound',800.00),
(27,9,'X-Ray',350.00),
(28,11,'GAD-7',450.00),
(29,17,'Stool Test',250.00),
(30,19,'Endoscopy',840.00),
(31,8,'Nasal Endoscopy',400.00),
(32,9,'X-Ray',350.00),
(33,1,'X-Ray',550.00),
(34,14,'ECG',600.00),
(35,2,'Blood Test',250.00),
(36,16,'Endoscopy',840.00),
(37,9,'X-Ray',350.00),
(38,18,'DRE',500.00),
(39,9,'ECG',600.00),
(40,3,'ECG',600.00),
(41,10,'MRI',500.00),
(42,14,'CT Scan',1000.00),
(43,1,'UPSIT',40.00),
(44,7,'Endoscopy',840.00),
(45,8,'Nasal Endoscopy',400.00),
(46,19,'CT Scan',1000.00),
(47,4,'Urine test',100.00),
(48,17,'Abdominal X-Ray',350.00),
(49,7,'Stool test',250.00),
(50,2,'X-Ray',250.00);

-- DESC statment

desc physician;
desc patient;
desc nurse;
desc department;
desc medical_analysis_report;
desc medical__procedure;

-- Data Retrival using select statement

select * from physician;
select * from patient;
select * from nurse;
select * from department;
select * from medical_analysis_report;
select * from medical__procedure;