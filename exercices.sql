-- exercice 1: insert new patient into the table of patients

INSERT INTO patients (first_name, last_name, gender, date_of_birth, phone_number)
VALUES
('Alex','Johnson','male','1990-07-15','1234567890');

-- exercice 2: show all the departments and thier locations
SELECT * from departments;

-- exercice 3: show the patients depending on the their date of birth from young to old
SELECT * FROM patients ORDER BY date_of_birth ASC;

-- exercice 4: show the available genders in the patients table without repeating them 
SELECT DISTINCT gender from patients;

-- exercice 5: show the first three rows of the table doctors
SELECT * FROM doctors LIMIT 3;

-- exercice 6 : show only patients born after the year 2000
SELECT * FROM patients WHERE EXTRACT(YEAR FROM date_of_birth) > 2000;

--  exercise 7 : show doctors who are in the department of CARDIOLOGY and NEUROLOGY 
SELECT * FROM doctors 
where 
department_id = (SELECT department_id FROM departments WHERE department_name = 'Cardiology')
OR
department_id = (SELECT department_id FROM departments WHERE department_name = 'Neurology') ;

-- exercise 8: show the admissions between decembre 1st and decembre 7th
SELECT * from admissions WHERE admission_date BETWEEN '2024-10-01' AND '2024-10-07';

-- exercice 9: add a colum for the ages category and fill the column for each patient depending on his age
ALTER TABLE patients ADD age_category VARCHAR(10); 

INSERT INTO patients (first_name, last_name,gender,date_of_birth,phone_number,email,address)
VALUES
('rabii', 'romani', 'male', '2020-07-23', '0699998888', 'rabii.ramani@example.com', 'Avenue Mohammed V, Casablanca, Morocco');

UPDATE patients
SET age_category = CASE
    WHEN (2024 - EXTRACT(YEAR from date_of_birth)) < 18 THEN 'Enfant'
    WHEN (2024 - EXTRACT(YEAR from date_of_birth)) BETWEEN 18 AND 50 THEN 'Adulte'
    WHEN (2024 - EXTRACT(YEAR from date_of_birth)) >= 50 THEN 'Senior'
END;

-- exrcice 10: calculate the total of the appointents
SELECT COUNT(*) AS total_appointments FROM appointments;

-- exercice 11: calculate the total of doctors in each department
SELECT department_id, COUNT(*) AS total_of_doctors
FROM doctors
GROUP BY department_id;

-- exercise 12 : calculate the average of age of the patients 
SELECT AVG(2024 - EXTRACT(YEAR from date_of_birth)) FROM patients;

-- exercice 13 : find the last appointment in the appointmnet table

SELECT appointment_date, appointment_time FROM appointments
WHERE (SELECT MAX(appointment_id) FROM patients);

-- exercice 14 : calculate the SUM of addmissions for each room 

SELECT room_id, COUNT(*) AS total_admissions
FROM admissions
GROUP BY room_id;

-- exercice 15: find all the users who don't have an email in the table 
SELECT * FROM patients WHERE email is NULL;

-- exercice 17: delete the appointments made before 2024
DELETE FROM appointments WHERE EXTRACT(YEAR from appointment_date) = 2024;

-- exercicse 18: change the name of a department into another name

    -- first let's add a department:
    INSERT INTO departments (department_name, location)
    VALUES
    ('Oncology', 'Building E');
    SELECT * from departments;

    -- now let's change the name of the department called "Oncology" to "Cancer Treatment"

UPDATE departments
SET department_name = 'Cancer Treatment' WHERE department_name = 'Oncology';

-- exercice 19: find the genders who are assigned to at least two patients
   
    -- first let's add a patient with the gender "other"

    INSERT INTO patients (first_name, last_name,gender,date_of_birth,phone_number,email,address)
    VALUES
    ('Jack', 'Marito', 'other', '2000-08-24', '0685858585', 'jack.marito@example.com', 'Avenue alwifaq, SAfi, Morocco');

    SELECT * FROM patients;

    -- now let's show the genders that have at least two patients 

SELECT gender, COUNT(*) FROM patients 
GROUP BY gender
HAVING count(*)>=2; --AND gender != 'other'; --gender= 'male' OR gender ='female' ; 

-- exercise 20: create a vue that shows active admissions in the hospital
    -- first let's create a view 
    CREATE View addmission_view 
    AS
    SELECT * FROM admissions WHERE NOW() > discharge_date;
    -- now let's call that view and see the rows it includes(the solution for the exercise)
SELECT * FROM addmission_view;


