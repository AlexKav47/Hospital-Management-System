CREATE SCHEMA IF NOT EXISTS HMS;
USE HMS;

-- Patient table
CREATE TABLE Patient (
    patientId INT PRIMARY KEY,
    name VARCHAR(255),
    dateOfBirth DATE,
    gender VARCHAR(10),
    phoneNumber VARCHAR(15),
    address VARCHAR(255),
    nextOfKin VARCHAR(255)
);

-- In_PatientPatients table
CREATE TABLE In_PatientPatients (
    patientId INT PRIMARY KEY,
    admissionDate DATE,
    dischargeDate DATE,
    roomNumber VARCHAR(20),
    FOREIGN KEY (patientId) REFERENCES Patient(patientId)
);

-- Out_PatientPatients table
CREATE TABLE Out_PatientPatients (
    patientId INT PRIMARY KEY,
    followUp VARCHAR(255),
    FOREIGN KEY (patientId) REFERENCES Patient(patientId)
);

-- Records table
CREATE TABLE Records (
    medicalRecordId INT,
    diagnosis VARCHAR(255),
    treatmentHistory VARCHAR(255),
    testResults VARCHAR(255),
    recordDate DATE,
    patientId INT,
    PRIMARY KEY (patientId, medicalRecordId),
    FOREIGN KEY (patientId) REFERENCES Patient(patientId)
);

-- Department table
CREATE TABLE Department (
    departmentId INT PRIMARY KEY,
    departmentName VARCHAR(255),
    departmentHead VARCHAR(255),
    location VARCHAR(255)
);

-- Resource table
CREATE TABLE Resource (
    resourceId INT PRIMARY KEY,
    resourceName VARCHAR(255),
    resourceType VARCHAR(50),
    resourceQuantity INT,
    availabilityStatus VARCHAR(20),
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department(departmentId)
);

-- Ward table
CREATE TABLE Ward (
    wardId INT PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(50),
    capacity INT,
    currentOccupancy INT,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department(departmentId)
);

-- In_PatientWards table
CREATE TABLE In_PatientWards (
    patientId INT,
    wardId INT,
    FOREIGN KEY (patientId) REFERENCES Patient(patientId),
    FOREIGN KEY (wardId) REFERENCES Ward(wardId)
);

-- Staff table
CREATE TABLE Staff (
    staffId INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    phoneNumber VARCHAR(15),
    dateOfBirth DATE,
    salary DECIMAL(10, 2),
    dateOfHire DATE,
    nextOfKin VARCHAR(255)
);

-- DoctorStaff table
CREATE TABLE DoctorStaff (
    staffId INT PRIMARY KEY,
    specialty VARCHAR(255),
    level VARCHAR(50),
    FOREIGN KEY (staffId) REFERENCES Staff(staffId)
);

-- NurseStaff table
CREATE TABLE NurseStaff (
    staffId INT PRIMARY KEY,
    assisting VARCHAR(255),
    RND VARCHAR(50),
    FOREIGN KEY (staffId) REFERENCES Staff(staffId)
);

-- Appointment table
CREATE TABLE Appointment (
    appointmentId INT PRIMARY KEY,
    appointmentDate DATE,
    appointmentTime TIME,
    purpose VARCHAR(255),
    status VARCHAR(50),
    patientId INT,
    staffId INT,
    FOREIGN KEY (patientId) REFERENCES Patient(patientId),
    FOREIGN KEY (staffId) REFERENCES Staff(staffId)
);

INSERT INTO Patient (patientId, name, dateOfBirth, gender, phoneNumber, address, nextOfKin) VALUES
(1, 'John Doe', '1990-05-15', 'Male', '123456789', '123 Main St', 'Jane Doe'),
(2, 'Jane Smith', '1985-10-20', 'Female', '987654321', '456 Elm St', 'John Smith'),
(3, 'Michael Johnson', '1978-03-08', 'Male', '555123789', '789 Oak St', 'Emily Johnson'),
(4, 'Emily Davis', '1995-12-25', 'Female', '456789123', '321 Pine St', 'Michael Davis'),
(5, 'David Brown', '1982-07-11', 'Male', '321987654', '654 Maple St', 'Sarah Brown'),
(6, 'Sarah Wilson', '1999-09-30', 'Female', '999888777', '987 Cedar St', 'David Wilson'),
(7, 'Jessica Martinez', '1973-01-17', 'Female', '111222333', '147 Cherry St', 'Daniel Martinez'),
(8, 'Daniel Lee', '1980-08-05', 'Male', '333444555', '852 Birch St', 'Jessica Lee'),
(9, 'Christopher White', '1993-06-22', 'Male', '666777888', '369 Walnut St', 'Olivia White'),
(10, 'Olivia Taylor', '1970-04-12', 'Female', '444555666', '963 Spruce St', 'Christopher Taylor'),
(11, 'Aiden Adams', '1987-11-03', 'Male', '888999111', '741 Oak St', 'Sophia Adams'),
(12, 'Sophia Garcia', '1992-02-18', 'Female', '111444777', '852 Pine St', 'Aiden Garcia'),
(13, 'Ethan Rodriguez', '1975-09-09', 'Male', '222555888', '369 Cedar St', 'Isabella Rodriguez'),
(14, 'Isabella Hernandez', '1988-06-14', 'Female', '777888999', '741 Elm St', 'Ethan Hernandez'),
(15, 'Mia King', '2000-12-31', 'Female', '333666999', '963 Maple St', 'Noah King');

INSERT INTO In_PatientPatients (patientId, admissionDate, dischargeDate, roomNumber) VALUES
(1, '2023-01-10', '2023-01-20', '101'),
(2, '2023-02-05', '2023-02-15', '102'),
(3, '2023-03-12', '2023-03-25', '103'),
(4, '2023-04-18', '2023-05-02', '104'),
(5, '2023-05-20', '2023-06-05', '105'),
(6, '2023-06-15', '2023-06-30', '106'),
(7, '2023-07-08', '2023-07-18', '107'),
(8, '2023-08-25', '2023-09-05', '108'),
(9, '2023-09-10', '2023-09-20', '109'),
(10, '2023-10-05', '2023-10-18', '110'),
(11, '2023-11-15', '2023-11-30', '111'),
(12, '2023-12-20', '2024-01-05', '112'),
(13, '2024-01-08', '2024-01-18', '113'),
(14, '2024-02-14', '2024-02-28', '114'),
(15, '2024-03-10', '2024-03-25', '115');

INSERT INTO Out_PatientPatients (patientId, followUp) VALUES
(1, '2023-01-25'),
(2, '2023-02-20'),
(3, '2023-03-30'),
(4, '2023-05-10'),
(5, '2023-06-15'),
(6, '2023-07-02'),
(7, '2023-07-25'),
(8, '2023-09-15'),
(9, '2023-09-30'),
(10, '2023-10-25'),
(11, '2023-12-05'),
(12, '2024-01-10'),
(13, '2024-01-25'),
(14, '2024-02-28'),
(15, '2024-03-31');

INSERT INTO Records (medicalRecordId, diagnosis, treatmentHistory, testResults, recordDate, patientId) VALUES
(1, 'Influenza', 'Prescribed antibiotics', 'Negative', '2023-01-15', 1),
(2, 'Fractured arm', 'Set arm in a cast', 'X-ray shows healing progress', '2023-02-10', 2),
(3, 'Pneumonia', 'Administered antibiotics', 'Improved lung function', '2023-03-20', 3),
(4, 'Appendicitis', 'Appendectomy performed', 'Successful recovery', '2023-04-25', 4),
(5, 'Diabetes', 'Insulin therapy initiated', 'Blood sugar levels stabilized', '2023-05-30', 5),
(6, 'Concussion', 'Rest advised', 'Gradual improvement observed', '2023-06-20', 6),
(7, 'Allergic reaction', 'Antihistamines administered', 'Symptoms subsided', '2023-07-15', 7),
(8, 'Hypertension', 'Prescribed medication', 'Blood pressure normalized', '2023-08-30', 8),
(9, 'Gastroenteritis', 'IV fluids administered', 'Recovered fully', '2023-09-15', 9),
(10, 'Bronchitis', 'Antibiotics prescribed', 'Improved respiratory function', '2023-10-10', 10),
(11, 'Migraine', 'Pain management therapy', 'Relieved symptoms', '2023-11-20', 11),
(12, 'Anxiety disorder', 'Therapy sessions', 'Coping strategies developed', '2023-12-30', 12),
(13, 'Strep throat', 'Prescribed antibiotics', 'Negative', '2024-01-05', 13),
(14, 'Arthritis', 'Physical therapy', 'Improved joint mobility', '2024-02-10', 14),
(15, 'Common cold', 'Symptomatic treatment', 'Recovery expected', '2024-03-15', 15);

INSERT INTO Department (departmentId, departmentName, departmentHead, location) VALUES
(1, 'Cardiology', 'Dr. Smith', 'Main Hospital Building, 3rd Floor'),
(2, 'Pediatrics', 'Dr. Johnson', 'Children''s Wing, 2nd Floor'),
(3, 'Orthopedics', 'Dr. Brown', 'Main Hospital Building, 4th Floor'),
(4, 'Oncology', 'Dr. Martinez', 'Main Hospital Building, 5th Floor'),
(5, 'Neurology', 'Dr. Lee', 'Main Hospital Building, 6th Floor'),
(6, 'Psychiatry', 'Dr. Taylor', 'Psychiatric Wing, 1st Floor'),
(7, 'Emergency Medicine', 'Dr. Adams', 'Emergency Department'),
(8, 'Obstetrics and Gynecology', 'Dr. Garcia', 'Maternity Wing, 3rd Floor'),
(9, 'Dermatology', 'Dr. Rodriguez', 'Main Hospital Building, 2nd Floor'),
(10, 'Ophthalmology', 'Dr. Hernandez', 'Main Hospital Building, 7th Floor');

INSERT INTO Resource (resourceId, resourceName, resourceType, resourceQuantity, availabilityStatus, departmentId) VALUES
(1, 'MRI Machine', 'Equipment', 2, 'Available', 5),
(2, 'X-ray Machine', 'Equipment', 3, 'Available', 3),
(3, 'Ultrasound Machine', 'Equipment', 2, 'In Use', 8),
(4, 'Blood Pressure Monitor', 'Equipment', 10, 'Available', 1),
(5, 'Ventilator', 'Equipment', 5, 'Available', 7),
(6, 'Hospital Beds', 'Furniture', 50, 'Available', 2),
(7, 'Surgical Instruments', 'Supplies', 100, 'Available', 4),
(8, 'Chemotherapy Drugs', 'Medication', 20, 'Available', 4),
(9, 'Sterile Gloves', 'Supplies', 500, 'Available', 3),
(10, 'Bandages', 'Supplies', 1000, 'Available', 7);

INSERT INTO Ward (wardId, name, type, capacity, currentOccupancy, departmentId) VALUES
(1, 'Cardiac Care Unit', 'Intensive Care Unit', 15, 10, 1),
(2, 'Pediatric Ward', 'General Ward', 20, 15, 2),
(3, 'Orthopedic Ward', 'General Ward', 25, 20, 3),
(4, 'Oncology Ward', 'General Ward', 30, 25, 4),
(5, 'Neurology Ward', 'General Ward', 20, 15, 5),
(6, 'Psychiatric Ward', 'Psychiatric Ward', 15, 10, 6),
(7, 'Emergency Department', 'Emergency Department', 40, 35, 7),
(8, 'Maternity Ward', 'Maternity Ward', 20, 15, 8),
(9, 'Dermatology Ward', 'General Ward', 25, 20, 9),
(10, 'Ophthalmology Ward', 'General Ward', 15, 10, 10);

INSERT INTO In_PatientWards (patientId, wardId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5);

INSERT INTO Staff (staffId, name, address, phoneNumber, dateOfBirth, salary, dateOfHire, nextOfKin) VALUES
(1, 'Dr. John Smith', '123 Main St', '1234567890', '1965-03-15', 150000, '2010-05-20', 'Jane Smith'),
(2, 'Dr. Emily Johnson', '456 Elm St', '9876543210', '1972-08-20', 140000, '2011-02-10', 'John Johnson'),
(3, 'Dr. Michael Brown', '789 Oak St', '5551237890', '1968-05-10', 160000, '2008-07-05', 'Sarah Brown'),
(4, 'Dr. Jessica Martinez', '321 Pine St', '4567891230', '1979-12-02', 170000, '2009-09-15', 'Daniel Martinez'),
(5, 'Dr. David Lee', '654 Maple St', '3219876540', '1970-10-25', 155000, '2012-04-30', 'Sophia Lee'),
(6, 'Dr. Sarah Taylor', '987 Cedar St', '9998887770', '1983-06-18', 145000, '2013-08-10', 'Christopher Taylor'),
(7, 'Dr. Daniel Adams', '147 Cherry St', '1112223330', '1975-07-12', 135000, '2014-10-20', 'Olivia Adams'),
(8, 'Dr. Christopher Garcia', '852 Birch St', '3334445550', '1988-04-30', 180000, '2015-12-05', 'Isabella Garcia'),
(9, 'Dr. Olivia Rodriguez', '369 Walnut St', '6667778880', '1977-09-22', 165000, '2016-03-15', 'Ethan Rodriguez'),
(10, 'Dr. Ethan Hernandez', '963 Spruce St', '4445556660', '1984-11-15', 170000, '2017-07-25', 'Mia Hernandez'),
(11, 'Nurse Sophia Adams', '741 Oak St', '8889991110', '1978-02-05', 75000, '2010-08-15', 'Aiden Adams'),
(12, 'Nurse Noah Garcia', '852 Pine St', '1114447770', '1990-07-20', 70000, '2011-09-30', 'Sophia Garcia'),
(13, 'Nurse Mia Rodriguez', '369 Cedar St', '2225558880', '1985-04-10', 70000, '2012-11-10', 'Ethan Rodriguez'),
(14, 'Nurse Aiden Hernandez', '741 Elm St', '7778889990', '1973-11-30', 75000, '2013-12-20', 'Isabella Hernandez'),
(15, 'Nurse Sophia King', '963 Maple St', '3336669990', '1980-09-18', 70000, '2014-10-05', 'Noah King');

INSERT INTO Appointment (appointmentId, appointmentDate, appointmentTime, purpose, status, patientId, staffId) VALUES
(1, '2023-01-20', '09:00:00', 'Follow-up visit', 'Confirmed', 1, 1),
(2, '2023-02-15', '10:30:00', 'Routine check-up', 'Confirmed', 2, 2),
(3, '2023-03-25', '11:00:00', 'Consultation', 'Confirmed', 3, 3),
(4, '2023-04-30', '14:00:00', 'Treatment planning', 'Confirmed', 4, 4),
(5, '2023-06-05', '08:30:00', 'Diagnostic tests', 'Confirmed', 5, 5),
(6, '2023-07-15', '13:00:00', 'Follow-up visit', 'Confirmed', 6, 6),
(7, '2023-08-20', '09:30:00', 'Routine check-up', 'Confirmed', 7, 7),
(8, '2023-09-25', '10:00:00', 'Consultation', 'Confirmed', 8, 8),
(9, '2023-10-30', '11:30:00', 'Treatment planning', 'Confirmed', 9, 9),
(10, '2023-12-05', '14:30:00', 'Diagnostic tests', 'Confirmed', 10, 10),
(11, '2024-01-10', '08:00:00', 'Follow-up visit', 'Confirmed', 11, 1),
(12, '2024-02-15', '09:45:00', 'Routine check-up', 'Confirmed', 12, 2),
(13, '2024-03-20', '11:15:00', 'Consultation', 'Confirmed', 13, 3),
(14, '2024-04-25', '14:45:00', 'Treatment planning', 'Confirmed', 14, 4),
(15, '2024-05-30', '08:15:00', 'Diagnostic tests', 'Confirmed', 15, 5);

INSERT INTO DoctorStaff (staffId, specialty, level) VALUES
(1, 'Cardiology', 'Senior'),
(2, 'Pediatrics', 'Senior'),
(3, 'Orthopedics', 'Senior'),
(4, 'Oncology', 'Senior'),
(5, 'Neurology', 'Senior'),
(6, 'Psychiatry', 'Senior'),
(7, 'Emergency Medicine', 'Senior'),
(8, 'Obstetrics and Gynecology', 'Senior'),
(9, 'Dermatology', 'Senior'),
(10, 'Ophthalmology', 'Senior');

INSERT INTO NurseStaff (staffId, assisting, RND) VALUES
(11, 'Dr. John Smith', 'Registered Nurse'),
(12, 'Dr. Emily Johnson', 'Registered Nurse'),
(13, 'Dr. Michael Brown', 'Registered Nurse'),
(14, 'Dr. Jessica Martinez', 'Registered Nurse'),
(15, 'Dr. David Lee', 'Registered Nurse');

CREATE VIEW staffInfo AS
SELECT staffId, name, phoneNumber 
FROM staff;

CREATE VIEW staffQualifications AS
SELECT s.staffId, s.name, ds.specialty AS doctorSpecialty, ns.assisting AS nurseAssisting
FROM Staff AS s

LEFT JOIN DoctorStaff AS ds ON s.staffId = ds.staffId
LEFT JOIN NurseStaff AS ns ON s.staffId = ns.staffId;

CREATE USER Department_Head IDENTIFIED BY 'DEPARTMENT_HEAD';

CREATE USER Doctor IDENTIFIED BY 'DOCTOR';

CREATE USER Nurse IDENTIFIED BY 'NURSE';



