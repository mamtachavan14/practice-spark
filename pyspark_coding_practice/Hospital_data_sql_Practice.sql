
------------------------------Table 1:-----------------------------------

CREATE TABLE imp.Patients (
    patient_id INT,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    total_bill DECIMAL(10,2)
);

SELECT* FROM imp.Patients

-------------------------- Table 2: Appointments-------------------------------------------------------------

CREATE TABLE imp.Appointments (
    appointment_id INT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    consultation_fee DECIMAL(10,2)
);

INSERT INTO imp.Appointments VALUES
(101, 1, 201, '2025-01-10', 1000),
(102, 2, 202, '2025-01-11', 1500),
(103, 1, 201, '2025-02-05', 1000),
(104, 3, 203, '2025-02-10', 2000),
(105, 3, 203, '2025-03-01', 2000),
(106, 5, 202, '2025-03-10', 1500);

SELECT* FROM imp.Appointments

-------------------------------Table 3: Treatments-----------------------------------------------------

CREATE TABLE imp.Treatments (
    treatment_id INT,
    patient_id INT,
    treatment_type VARCHAR(50),
    treatment_cost DECIMAL(10,2)
);

INSERT INTO imp.Treatments VALUES
(1001, 1, 'Physiotherapy', 5000),
(1002, 2, 'Dental Surgery', 20000),
(1003, 3, 'Cardiac Surgery', 100000),
(1004, 4, 'Eye Checkup', 3000),
(1005, 5, 'Orthopedic Surgery', 60000);

SELECT * FROM imp.Treatments

--------------------------------Table 4:  Doctors ---------------------------------------------

CREATE TABLE imp.Doctors (
    doctor_id INT,
    doctor_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO imp.Doctors VALUES
(201, 'Dr. Meera Iyer', 'Cardiology', 150000),
(202, 'Dr. Suresh Rao', 'Orthopedics', 120000),
(203, 'Dr. Anita Desai', 'Cardiology', 180000),
(204, 'Dr. Vikram Jain', 'Neurology', 200000),
(205, 'Dr. Ritu Malhotra', 'Orthopedics', 140000);

SELECT * FROM imp.Doctors

----------------------------------- Table 5: Hospital_Staff------------------------------------------

CREATE TABLE imp.Hospital_Staff (
    staff_id INT,
    staff_name VARCHAR(50),
    manager_id INT
);

INSERT INTO imp.Hospital_Staff VALUES
(1, 'Hospital Director', NULL),
(2, 'Medical Superintendent', 1),
(3, 'Senior Doctor', 2),
(4, 'Junior Doctor', 3),
(5, 'Nurse Lead', 3),
(6, 'Staff Nurse', 5);

SELECT * FROM imp.Hospital_Staff
