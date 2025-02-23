USE HMS;

-- Q1: Show the names, admission dates, discharge dates, 
-- and room numbers of patients who were admitted to the hospital.
SELECT p.name, ip.admissionDate, ip.dischargeDate, ip.roomNumber
FROM In_PatientPatients ip
JOIN Patient p ON ip.patientId = p.patientId;

-- Q2: Display the names and next of kin information for all patients 
-- who visited the hospital as out-patients.
 SELECT p.name, p.nextOfKin
FROM Out_PatientPatients op
JOIN Patient p ON op.patientId = p.patientId;

-- Q3: List the appointment dates, times, and purposes 
-- for all appointments scheduled for a specific patient.
SELECT a.appointmentDate, a.appointmentTime, a.purpose
FROM Appointment a
JOIN Patient p ON a.patientId = p.patientId
WHERE p.name = 'Michael Johnson';

-- Q4: Show the medical records, diagnoses, and treatment histories for a particular patient.
SELECT r.medicalRecordId, r.diagnosis, r.treatmentHistory
FROM Records r
JOIN Patient p ON r.patientId = p.patientId
WHERE p.name = 'John Doe';

-- Q5: List the names, types, and quantities of all available resources in a specific department.
SELECT r.resourceName, r.resourceType, r.resourceQuantity
FROM Resource r
JOIN Department d ON r.departmentId = d.departmentId
WHERE d.departmentName = 'Oncology';

-- Q6: Display the names, current occupancies, and capacities of all hospital wards.
SELECT w.name, w.currentOccupancy, w.capacity
FROM Ward w;

-- Q7: List the names, specialties, and levels of all doctors employed at the hospital.
SELECT s.name, ds.specialty, ds.level
FROM DoctorStaff ds
JOIN Staff s ON ds.staffId = s.staffId;

-- Q8: Show the names and phone numbers of all nurses working at the hospital.
SELECT s.name, s.phoneNumber
FROM NurseStaff ns
JOIN Staff s ON ns.staffId = s.staffId;




















GRANT ALL PRIVILEGES ON HospitalManagementSystem TO Department_Head;

GRANT SELECT ON ward TO Doctor;
GRANT SELECT ON resource TO Doctor;
GRANT SELECT ON staffInfo TO Doctor;
GRANT SELECT ON staffQualifications TO Doctor;
GRANT SELECT, UPDATE ON records TO Doctor;
GRANT CREATE, SELECT, UPDATE ON patient TO Doctor;
GRANT CREATE, SELECT, UPDATE ON appointment TO Doctor;

GRANT SELECT ON patient TO Nurse;
GRANT SELECT ON resource TO Nurse;
GRANT SELECT ON staffInfo TO Nurse;
GRANT SELECT ON staffQualifications TO Nurse;
GRANT SELECT, UPDATE ON ward TO Nurse;
GRANT CREATE, SELECT, UPDATE ON records TO Nurse;