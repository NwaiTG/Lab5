{\rtf1\ansi\ansicpg1252\cocoartf2820
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 USE `dental-serguries`;  -- Select the database\
\
-- Display the list of ALL Dentists registered in the system, sorted in ascending order of their lastNames\
SELECT d.peopleId, dentistId, firstName, lastName, email, phone, specilization\
FROM dentist d\
INNER JOIN people\
ON d.peopleId = people.peopleId\
ORDER BY people.lastName ASC;\
\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
\
-- Display the list of ALL Appointments for a given Dentist by their dentist_Id\
-- number. Include in the result, the Patient information.\
select apm.appointmentDateTime, concat(pe.firstName, ' ', pe.lastName) as patient_full_name, pe.email, pe.phone\
from appointmentRecord apm\
inner join dentist d\
on apm.dentistId = d.dentistId\
inner join patient p\
on apm.patientId = p.patientId\
inner join people pe\
on p.peopleId = pe.peopleId\
where d.dentistId = 'D001'\
\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
\
-- Display the list of ALL Appointments that have been scheduled at a Surgery Location\
SELECT \
  CONCAT(d.firstName, ' ', d.lastName) AS dentistName,\
  pat.patientId AS patNo,\
  CONCAT(pp.firstName, ' ', pp.lastName) AS patName,\
  DATE_FORMAT(a.appointmentDateTime, '%d-%b-%y') AS `appointment date`,\
  TIME_FORMAT(a.appointmentDateTime, '%H.%i') AS `time`,\
  a.surgeryId AS surgeryNo\
FROM appointmentrecord a\
INNER JOIN dentist dnt ON a.dentistId = dnt.dentistId\
INNER JOIN people d ON dnt.peopleId = d.peopleId\
INNER JOIN patient pat ON a.patientId = pat.patientId\
INNER JOIN people pp ON pat.peopleId = pp.peopleId\
where a.surgeryId = 'S15'\
ORDER BY a.appointmentDateTime;\
\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
\
-- Display the list of the Appointments booked for a given Patient on a given Date.\
SELECT \
  a.appointmentId AS appointmentId,\
  CONCAT(d.firstName, ' ', d.lastName) AS dentistName,\
  DATE_FORMAT(a.appointmentDateTime, '%d-%b-%y') AS appointmentDate,\
  TIME_FORMAT(a.appointmentDateTime, '%H:%i') AS appointmentTime,\
  a.surgeryId AS surgeryNo\
FROM appointmentrecord a\
INNER JOIN dentist dnt ON a.dentistId = dnt.dentistId\
INNER JOIN people d ON dnt.peopleId = d.peopleId\
INNER JOIN patient pat ON a.patientId = pat.patientId\
INNER JOIN people pp ON pat.peopleId = pp.peopleId\
WHERE a.patientId = 'P108'        \
  AND DATE(a.appointmentDateTime) = '2013-09-12' \
ORDER BY a.appointmentDateTime;\
\
}