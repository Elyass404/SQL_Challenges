-- Active: 1733760231294@@127.0.0.1@3306@hospitalmanagement

-- Create a database called hospitalmanagement
CREATE DATABASE hospitalmanagement;
-- checking the available databases 
SHOW DATABASES;

-- Create the neccessary tables inside our database "hospitalmanagement "

CREATE table patients(
patient_id int PRIMARY KEY AUTO_INCREMENT,
first_name varchar(50),
last_name varchar (50),
gender enum('male','female','other'), 
date_of_birth date ,
phone_number varchar(15),
email varchar(100),
address varchar (255)
);

CREATE TABLE departments(
department_id int PRIMARY KEY AUTO_INCREMENT,
department_name varchar(50),
location varchar(100)
);

CREATE TABLE medications (
medication_id int PRIMARY KEY AUTO_INCREMENT,
medication_name varchar(100),
dosage varchar(50)
);

CREATE TABLE rooms(
room_id int PRIMARY KEY AUTO_INCREMENT,
room_number varchar(10),
room_type ENUM('General','Private','ICU'),
availability tinyint(1)
);

CREATE table staff(
staff_id int PRIMARY KEY AUTO_INCREMENT,
first_name varchar(50), 
last_name varchar(50),
job_title varchar(50),
phone_number varchar(15),
email varchar(100),
department_id int ,
FOREIGN KEY(department_id) REFERENCES departments(department_id)

);

CREATE TABLE doctors(
doctor_id int PRIMARY KEY AUTO_INCREMENT,
first_name varchar(50),
last_name varchar(50),
specialization varchar(50),
phone_number varchar(15),
email varchar(100),
department_id int ,
FOREIGN KEY(department_id) REFERENCES departments(department_id)

);

CREATE TABLE admissions(
admission_id int PRIMARY KEY AUTO_INCREMENT,
patient_id int, 
room_id int, 
admission_date date, 
discharge_date date,
FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE appointments(
appointment_id int PRIMARY KEY AUTO_INCREMENT, 
appointment_date date,
appointment_time time, 
doctor_id int,
patient_id int,
reason varchar(255),
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
    
);

CREATE TABLE prescriptions (
prescription_id int PRIMARY KEY AUTO_INCREMENT,
patient_id int,
doctor_id int, 
medication_id int,
prescription_date date, 
dosage_instructions varchar(255),
FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
FOREIGN KEY (medication_id) REFERENCES medications(medication_id)
);

-- inserting values into "Patients Table"--
INSERT INTO patients (first_name, last_name,gender,date_of_birth,phone_number,email,address)
VALUES
('Hassan', 'El Amrani', 'male', '1985-07-23', '0650123456', 'hassan.elamrani@example.com', 'Avenue Mohammed V, Casablanca, Morocco'),
('Sara', 'Benjelloun', 'female', '1990-11-15', '0651234567', 'sara.benjelloun@example.com', 'Rue de la Marche, Rabat, Morocco'),
('Mohammed', 'Fassi', 'male', '1978-04-09', '0652345678', 'mohammed.fassi@example.com', 'Quartier Hassan, Marrakesh, Morocco'),
('Fatima', 'El Idrissi', 'female', '1995-02-20', '0653456789', 'fatima.elidrissi@example.com', 'Boulevard Mohammed VI, Tangier, Morocco'),
('Ali', 'Ait Lhaj', 'male', '1982-05-30', '0654567890', 'ali.aitlhaj@example.com', 'Avenue Mohammed VI, Fes, Morocco'),
('Asma', 'Benkirane', 'female', '1992-08-05', '0655678901', 'asma.benkirane@example.com', 'Quartier Souissi, Rabat, Morocco'),
('Youssef', 'El Bouzidi', 'male', '1988-12-11', '0656789012', 'youssef.elbouzidi@example.com', 'Rue Oued Issil, Marrakesh, Morocco'),
('Noura', 'Tazi', 'female', '1994-03-18', '0657890123', 'nora.tazi@example.com', 'Avenue Mohamed V, Casablanca, Morocco'),
('Salman', 'Haddad', 'male', '1986-06-22', '0658901234', 'salman.haddad@example.com', 'Rue Zerktouni, Tangier, Morocco'),
('Lina', 'El Karoui', 'female', '1998-09-27', '0659012345', 'lina.elkaroui@example.com', 'Boulevard de la Corniche, Agadir, Morocco');

-- inserting data into the departements table--

INSERT INTO departments (department_name,location)
VALUES
('Cardiology', 'Building A'),
('Neurology', 'Building B'),
('Gynecology', 'Building C'),
('Dermatology', 'Building D');

-- inserting data into the medications table--

INSERT INTO medications (medication_name,dosage)
VALUES
('Paracetamol', '500mg'),
('Ibuprofen', '200mg'),
('Aspirin', '100mg'),
('Amoxicillin', '250mg'),
('Metformin', '500mg'),
('Lisinopril', '10mg'),
('Omeprazole', '20mg'),
('Salbutamol', '100mcg'),
('Prednisolone', '5mg'),
('Furosemide', '40mg');

-- inserting data into the rooms table--

INSERT INTO rooms (room_number,room_type,availability)
VALUES
('101', 'General', 1),
('102', 'Private', 0),
('103', 'ICU', 1),
('104', 'General', 1),
('105', 'Private', 1),
('106', 'ICU', 0),
('107', 'General', 1),
('108', 'Private', 0),
('109', 'ICU', 1),
('110', 'General', 0);

-- inserting data into the staff table--

INSERT INTO staff (first_name,last_name,job_title,phone_number,email,department_id)
VALUES
('Yassine', 'El Hachimi', 'Nurse', '0651122334', 'yassine.elhachimi@example.com', 1),
('Khalid', 'Bennani', 'Radiology Technician', '0652233445', 'khalid.bennani@example.com', 2),
('Meryem', 'Alami', 'Receptionist', '0653344556', 'meryem.alami@example.com', 3),
('Imane', 'Tazi', 'Pharmacist', '0654455667', 'imane.tazi@example.com', 4),
('Hicham', 'Kabbaj', 'Lab Technician', '0655566778', 'hicham.kabbaj@example.com', 2),
('Rania', 'Benhamza', 'Administrative Assistant', '0656677889', 'rania.benhamza@example.com', 3),
('Mohamed', 'Fahmi', 'Nurse', '0657788990', 'mohamed.fahmi@example.com', 1),
('Amine', 'Jabri', 'Medical Records Clerk', '0658899001', 'amine.jabri@example.com', 4),
('Sara', 'El Taleb', 'Receptionist', '0659900112', 'sara.eltaleb@example.com', 1),
('Said', 'El Amrani', 'Security Personnel', '0651001122', 'said.elamrani@example.com', 2),
('Kenza', 'Ben Ali', 'Nurse', '0652112233', 'kenza.benali@example.com', 3),
('Zakaria', 'El Habbach', 'Medical Equipment Technician', '0653123344', 'zakaria.elhabbach@example.com', 4),
('Zahra', 'Moutaouakil', 'Cleaner', '0654134455', 'zahra.moutaouakil@example.com', 1),
('Omar', 'Zitouni', 'Medical Records Assistant', '0655145566', 'omar.zitouni@example.com', 2),
('Rachid', 'Ait Lahlou', 'Emergency Medical Technician', '0656256677', 'rachid.aitlahlou@example.com', 3),
('Fatima', 'Bensalem', 'Nurse', '0657367788', 'fatima.bensalem@example.com', 4),
('Hassan', 'El Ouali', 'Janitor', '0658478899', 'hassan.elouali@example.com', 2);


-- inserting data into the doctors table--
INSERT INTO doctors (first_name,last_name,specialization,phone_number,email,department_id)
VALUES
('Yassine', 'El Hachimi', 'Cardiologist', '0650123456', 'yassine.elhachimi@example.com', 1),
('Nadia', 'El Moussawi', 'Neurologist', '0651234567', 'nadia.elmoussawi@example.com', 2),
('Imane', 'Boukhlouf', 'Gynecologist', '0652345678', 'imane.boukhlouf@example.com', 3),
('Reda', 'Ezzati', 'Dermatologist', '0653456789', 'reda.ezzati@example.com', 4),
('Salma', 'El Kharraz', 'Cardiologist', '0654567890', 'salma.elkharraz@example.com', 1),
('Rachid', 'Laaroussi', 'Neurologist', '0655678901', 'rachid.laaroussi@example.com', 2),
('Omar', 'Fahmi', 'Gynecologist', '0656789012', 'omar.fahmi@example.com', 3),
('Khalil', 'Benali', 'Dermatologist', '0657890123', 'khalil.benali@example.com', 4),
('Sara', 'Jemaa', 'Cardiologist', '0658901234', 'sara.jemaa@example.com', 1),
('Mustafa', 'El Ouafi', 'Neurologist', '0659012345', 'mustafa.elouafi@example.com', 2);

-- inserting data into the admission table--

INSERT INTO admissions (patient_id,room_id,admission_date,discharge_date)
VALUES
(1, 1, '2024-11-01', '2024-11-10'),   
(2, 1, '2024-11-03', '2024-11-12'),   
(3, 2, '2024-11-05', '2024-11-15'),   
(4, 3, '2024-11-06', '2024-11-13'),   
(5, 4, '2024-11-07', '2024-11-14'),   
(6, 5, '2024-11-08', '2024-11-18'),   
(7, 5, '2024-11-09', '2024-11-16'),    
(8, 6, '2024-11-10', '2024-11-20'),   
(9, 7, '2024-11-11', '2024-11-22'),  
(10, 8, '2024-11-12', '2024-11-25');

-- inserting data into the appointments table--

INSERT INTO appointments (appointment_date,appointment_time,doctor_id,patient_id,reason)
VALUES
('2024-11-01', '09:00:00', 1, 1, 'Routine check-up'), 
('2024-11-02', '10:30:00', 2, 2, 'Neurological assessment'), 
('2024-11-03', '14:00:00', 3, 3, 'Pregnancy check-up'), 
('2024-11-04', '11:30:00', 4, 4, 'Skin rash examination'),  
('2024-11-05', '15:00:00', 1, 5, 'Heart palpitations'), 
('2024-11-06', '09:30:00', 2, 6, 'Migraine assessment'),
('2024-11-07', '12:00:00', 3, 7, 'Routine gynecological exam'), 
('2024-11-08', '16:00:00', 4, 8, 'Acne treatment consultation'), 
('2024-11-09', '08:45:00', 1, 9, 'Follow-up on heart condition'), 
('2024-11-10', '10:00:00', 2, 10, 'Neurological evaluation'),
('2024-11-12', '09:15:00', 4, 2, 'Dermatology consultation for skin conditions'),
('2024-11-17', '12:30:00', 1, 7, 'Cardiology follow-up'),
('2024-11-20', '15:00:00', 4, 10, 'Skin treatment consultation'),
('2024-11-15', '17:00:00', 3, 5, 'Pregnancy test consultation');

-- inserting data into the prescriptions table--

INSERT INTO prescriptions (patient_id,doctor_id,medication_id,prescription_date,dosage_instructions)
VALUES
(1, 1, 1, '2024-11-01', 'Take 1 tablet daily after meals for 7 days'), 
(2, 2, 2, '2024-11-02', 'Take 1 tablet every 8 hours for 5 days'),  
(3, 3, 3, '2024-11-03', 'Take 1 tablet twice a day for 7 days'),  
(4, 4, 4, '2024-11-04', 'Apply cream on affected area twice daily for 10 days'),  
(5, 1, 5, '2024-11-05', 'Take 1 tablet in the morning and 1 at night for 7 days'), 
(6, 2, 1, '2024-11-06', 'Take 1 tablet daily after meals for 7 days'),  
(7, 3, 2, '2024-11-07', 'Take 1 tablet every 6 hours for 5 days'),  
(8, 4, 3, '2024-11-08', 'Take 1 tablet twice a day for 7 days'), 
(9, 1, 4, '2024-11-09', 'Apply cream to affected skin twice daily for 7 days'),  
(2, 4, 3, '2024-11-12', 'Take 1 tablet twice a day for 7 days'), 
(7, 1, 1, '2024-11-17', 'Take 1 tablet daily after meals for 7 days'), 
(10, 4, 2, '2024-11-20', 'Take 1 tablet every 8 hours for 5 days'),   
(5, 3, 4, '2024-11-15', 'Apply cream on affected area twice daily for 10 days');

-- Give the unique constraint unique to the columns bellow
ALTER TABLE doctors ADD UNIQUE (phone_number,email);
ALTER TABLE patients ADD UNIQUE (phone_number,email);
ALTER TABLE staff ADD UNIQUE (phone_number,email);
ALTER TABLE rooms ADD UNIQUE (room_number);
ALTER TABLE departments ADD UNIQUE (department_name);
ALTER TABLE medications ADD UNIQUE (medication_name);

INSERT INTO patients (first_name, last_name,gender,date_of_birth,phone_number,address)
VALUES
('Hilal', 'Rahmouni', 'male', '2000-09-25', '0644444444', 'Avenue Mohammed V, yousoufia, Morocco')