use ismgroup10;

-- drop view age;
-- drop table ad;
-- drop table customer;
-- drop table education;
-- drop table experience;
-- drop table ameasupporter;

create table AMEASupporter (
email varchar(50) PRIMARY KEY,
name varchar(30),
surname varchar(30),
phone bigint(10),
serviceTown enum("Athens", "Thessaloniki", "Crete", "Patra"),
serviceArea varchar(100),
password varchar(40),
sex enum ('male', 'female'),
birthdate date,
languages varchar(70),
drivingLisence boolean,
carOwner boolean,
payPerHour double,
available boolean,
monday boolean,
tuesday boolean,
wednesday boolean,
thursday boolean,
friday boolean,
saturday boolean,
sunday boolean,
deaf boolean,
dyslexia boolean,
epilipsy boolean,
autism boolean,
blind boolean,
mobilityImpaired boolean,
down boolean,
learningSupportPrimarySchool boolean,
learningSupportJuniorHighSchool boolean,
learningSupportSeniorHighSchool boolean,
occupationalTherapy boolean,
logotherapy boolean,
schoolCompanion boolean,
externalCompanion boolean
);

create table Experience (
id int PRIMARY KEY AUTO_INCREMENT,
AMEASupEmail varchar(50),
description varchar(500),
startdate date,
enddate date,
FOREIGN KEY (`AMEASupEmail`) REFERENCES `AMEASupporter` (`email`) 
);

create table Education (
id int PRIMARY KEY AUTO_INCREMENT,
AMEASupEmail varchar(50),
title varchar(70),
typeOfEducation ENUM ('High School', 'Bachelor', 'Master', 'Doctorate', 'Certification'),
FOREIGN KEY (`AMEASupEmail`) REFERENCES `AMEASupporter` (`email`) 
);

create table Customer (
email varchar(60) PRIMARY KEY,
phone bigint(10),
password varchar(40),
name varchar(40),
surname varchar(40)
);

create table Ad (
id int PRIMARY KEY AUTO_INCREMENT,
customerEmail varchar(60),
startDate date,
endDate date,
service varchar(255),
disability varchar(255),
description varchar(300),
location varchar(45),
FOREIGN KEY (`customerEmail`) REFERENCES `Customer` (`email`) 
);

create view Age (email,age)
as select email, DATEDIFF(birthdate , CURDATE())
from AMEASupporter;

insert into ameasupporter 
(email,name,surname,phone,serviceTown,serviceArea,password,sex,birthdate,languages,drivingLisence,carOwner,
payPerHour,available,monday,tuesday,wednesday,thursday,friday,saturday,sunday,deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down,
learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion,
externalCompanion) values
("mairiii@gmail.com","Mairi","Bakou","6939939993","Athens","Sidagma,Omonoia and Peristeri","123456","female","1975-05-17","English and Greek", TRUE, TRUE,
"15.5", true, false, true, false, true, false, true, true, true, false,false, false, true, true, false,
true, true, true, false, false, false, false);
insert into ameasupporter 
(email,name,surname,phone,serviceTown,serviceArea,password,sex,birthdate,languages,drivingLisence,carOwner,
payPerHour,available,monday,tuesday,wednesday,thursday,friday,saturday,sunday,deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down,
learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion,
externalCompanion) values
("panathas@otenet.com","Panos","Moskoliou","6939038793","Patra","Patra","1i34we","male","1995-12-01","English, French and Greek", TRUE, False,
"10.0", true, false, true, true, False, false, false, false, true, false, false, false, true, true, false,
false, false, false, false, false, true, true);
insert into ameasupporter 
(email,name,surname,phone,serviceTown,serviceArea,password,sex,birthdate,languages,drivingLisence,carOwner,
payPerHour,available,monday,tuesday,wednesday,thursday,friday,saturday,sunday,deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down,
learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion,
externalCompanion) values
("kkitsoo@hotmail.com","Kaiti","Kitso","6939973061","Crete","Hiraklion","atyjgfr2","female","1989-09-29","English and German", TRUE, TRUE,
"19.7", true, false, false, false, true, false, true, false, false, true, false, false, false, false, false,
true, true, true, false, false, true, true);
insert into ameasupporter 
(email,name,surname,phone,serviceTown,serviceArea,password,sex,birthdate,languages,drivingLisence,carOwner,
payPerHour,available,monday,tuesday,wednesday,thursday,friday,saturday,sunday,deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down,
learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion,
externalCompanion) values
("moli@outlook.com","Moli","Grigoriou","6934567993","Athens","Nea Ionia, Halandri, Holorgos and Filothei","12345","female","1994-05-30","English, German, French and Greek", TRUE, TRUE,
"22", true, true, true, true, true, false, true, true, false, false, false, true, false, false, true,
false, false, false, false, true, true, true);
INSERT INTO AMEASupporter (email,name,surname,phone,serviceTown,serviceArea,password,sex,birthdate,languages,drivingLisence,carOwner,payPerHour,available,monday,tuesday,wednesday,thursday,friday,saturday,sunday,deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down,learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion,externalCompanion) Values ('anna.sm@gmail.com','Anna','Sammel',6943563266,'Athens','Petralona','anadelta24','female','1995-04-03','Greek, English, German, Spanish',TRUE,TRUE,15.00,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE);
INSERT INTO AMEASupporter (email,name,surname,phone,serviceTown,serviceArea,password,sex,birthdate,languages,drivingLisence,carOwner,payPerHour,available,monday,tuesday,wednesday,thursday,friday,saturday,sunday,deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down,learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion,externalCompanion) Values ('peter.salivan@gmail.com','Peter','Salivan',6974363724,'Crete','Agios Nikolaos','samurai3000','male','1997-02-26','Greek, English, French',TRUE,TRUE,10.00,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE);
INSERT INTO AMEASupporter (email,name,surname,phone,serviceTown,serviceArea,password,sex,birthdate,languages,drivingLisence,carOwner,payPerHour,available,monday,tuesday,wednesday,thursday,friday,saturday,sunday,deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down,learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion,externalCompanion) Values ('nick.pap@gmai.com','Nikolaos','Papagrigorios',6985362119,'Thessaloniki','Ampelokipoi,Sykies','purgos1998','male','1998-12-26','Greek, English',TRUE,FALSE,8.00,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE);
INSERT INTO AMEASupporter (email,name,surname,phone,serviceTown,serviceArea,password,sex,birthdate,languages,drivingLisence,carOwner,payPerHour,available,monday,tuesday,wednesday,thursday,friday,saturday,sunday,deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down,learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion,externalCompanion) Values ('elliedam@gmail.com','Ellisavet','Damianou',6948905360,'Athens','Goudi,Zografou','orxidea33','female','1985-07-23','Greek, English, German, Italian',TRUE,TRUE,35.00,TRUE,TRUE,TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE);
INSERT INTO AMEASupporter (email,name,surname,phone,serviceTown,serviceArea,password,sex,birthdate,languages,drivingLisence,carOwner,payPerHour,available,monday,tuesday,wednesday,thursday,friday,saturday,sunday,deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down,learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion,externalCompanion) Values ('stella@example.com','Stella','Pappa',6975674545,'Athens','North side','stellaki12','female','1985-04-03','Greek, English,  Spanish',TRUE,FALSE,15.00,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE);
INSERT INTO AMEASupporter (email,name,surname,phone,serviceTown,serviceArea,password,sex,birthdate,languages,drivingLisence,carOwner,payPerHour,available,monday,tuesday,wednesday,thursday,friday,saturday,sunday,deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down,learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion,externalCompanion) Values ('dimitra@example.com','Dimitra','Chatzi',6902465156,'Thessaloniki','Ilioupoli','dimitra98','female','1990-12-07','Greek, French',TRUE,FALSE,15.00,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE);
INSERT INTO AMEASupporter (email,name,surname,phone,serviceTown,serviceArea,password,sex,birthdate,languages,drivingLisence,carOwner,payPerHour,available,monday,tuesday,wednesday,thursday,friday,saturday,sunday,deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down,learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion,externalCompanion) Values ('ioanna@example.com','Ioanna','Nikolaou',6964294695,'Crete','Agios Nikolaos','ioanna57','female','1995-06-24','Greek, English,  French',TRUE,TRUE,20.00,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE);
INSERT INTO AMEASupporter (email,name,surname,phone,serviceTown,serviceArea,password,sex,birthdate,languages,drivingLisence,carOwner,payPerHour,available,monday,tuesday,wednesday,thursday,friday,saturday,sunday,deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down,learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion,externalCompanion) Values ('katerina@example.com','Katerina','Dimitriou',6973481705,'Patra','Center','katerina003','female','1988-08-15','Greek',FALSE,FALSE,15.00,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE);

INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('mairiii@gmail.com','4th High School of Peristeri','High School');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('mairiii@gmail.com','Disability studies, Michigan University','Bachelor');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('mairiii@gmail.com','Deaf and Blind Treatment, Michigan University','Master');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('panathas@otenet.com','2nd High School of Patras','High School');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('panathas@otenet.com','Pedagogical Science, University of Patras','Bachelor');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('kkitsoo@hotmail.com','10th High School Hiraklion','High School');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('moli@outlook.com','7th High School Halandri','High School');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('anna.sm@gmail.com','18th High School Athens','High School');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('anna.sm@gmail.com','Medical Univercity of Patra', 'Bachelor' );
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('peter.salivan@gmail.com', '45th High School Athens', 'High School');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('peter.salivan@gmail.com','Pedagogical Univercity of Athens', 'Bachelor');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('elliedam@gmail.com', '2nd Experimental High School Athens', 'High School');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('elliedam@gmail.com', 'Medical University of Athens', 'Bachelor');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('elliedam@gmail.com', 'Therapy for Motor Problems', 'Master');
INSERT INTO Education (AMEASupEmail, title, typeOfEducation) Values ('nick.pap@gmai.com', '68th High School Athens', 'High School');
INSERT INTO EDUCATION (AMEASupEmail,title,typeOfEducation) VALUES ('stella@example.com','Logotherapist','Bachelor');
INSERT INTO EDUCATION (AMEASupEmail,title,typeOfEducation) VALUES ('stella@example.com','Logotherapy in digital life','Master');
INSERT INTO EDUCATION (AMEASupEmail,title,typeOfEducation) VALUES ('dimitra@example.com','Nurse','Bachelor');
INSERT INTO EDUCATION (AMEASupEmail,title,typeOfEducation) VALUES ('dimitra@example.com','Nursery of people with disability problemes','Certification');
INSERT INTO EDUCATION (AMEASupEmail,title,typeOfEducation) VALUES ('ioanna@example.com','Physiotherapist','Bachelor');

INSERT INTO experience (AmeaSupEmail,description,startdate,enddate) Values ('mairiii@gmail.com','I have been taking care of a blind child for 5 years. '
,'2015-1-1','2019-12-31');
INSERT INTO experience (AmeaSupEmail,description,startdate,enddate) Values ('mairiii@gmail.com','I help if a child in a wheelchair at school and at home with his homework.'
,'2020-1-1', null);
INSERT INTO experience (AmeaSupEmail,description,startdate,enddate) Values ('panathas@otenet.com','I have been taking care of a deaf child for 1.5 years. I make her company  and i played with her. '
,'2017-05-1','2018-12-31');
INSERT INTO experience (AmeaSupEmail,description,startdate,enddate) Values ('panathas@otenet.com','I kept company with a high school girl, who is blind.'
,'2019-01-01','2020-02-28');
INSERT INTO experience (AmeaSupEmail,description,startdate,enddate) Values ('kkitsoo@hotmail.com','I help a primary school boy with his homework.'
,'2018-01-01',null);
INSERT INTO experience (AMEASupEmail,description,startdate,enddate) Values ('anna.sm@gmail.com','I have given private lessons for children with dyslexia. I helped them study and do their homework.','2016-02-01','2016-11-30');
INSERT INTO experience (AmeaSupEmail,description,startdate,enddate) Values ('anna.sm@gmail.com','I have worked as an assistant for doctor Alexandros Soumalisis who specializes in autistic people where I gained a lot o experience on how to take care of them and help them integrate into society.', '2017-09-01', '2019-02-15');
INSERT INTO experience (AmeaSupEmail,description,startdate,enddate) Values ('peter.salivan@gmail.com','I helped a 12-year-old child, who had an accident and lost his legs, with his everyday activities. I kept him company, I tried to cheer him up and help them go back to school. I also accompanied him to and from school and I took him to various activities and places such  as the campus for special needs.','2017-04-17','2020-03-15');
INSERT INTO experience (AmeaSupEmail,description,startdate,enddate) Values ('elliedam@gmail.com', 'I used to take care of elderly people, change their clothes, help them eat and keep them company.', '2001-07-23','2004-11-12');
INSERT INTO experience (AmeaSupEmail,description,startdate,enddate) Values ('elliedam@gmail.com','I worked at the "Medical Institution for Physiotherapy" for 3 years as an assistant','2010-03-01','2013-06-30');
INSERT INTO experience (AmeaSupEmail,description,startdate,enddate) Values ('elliedam@gmail.com', 'I am working freelance as an experienced physiotherapist and logotherapist for children with mobility problems', '2013-08-03', null);
INSERT INTO experience (AmeaSupEmail,description,startdate,enddate) Values ('nick.pap@gmai.com','I have been taking care of my sister who is in a wheelchair for the past 5 years. I take her to her doctors, play with her, keep her company and help her with her everyday routine, so I think I will be adequate for a similar job.','2020-12-20',null);
INSERT INTO Experience (AMEASupEmail,description,startdate,enddate) VALUES ('stella@example.com','Dyslexia Supporter','2000-12-07','2010-07-10');
INSERT INTO Experience (AMEASupEmail,description,startdate,enddate) VALUES ('stella@example.com','Dyslexia Supporter','2008-03-15','2012-06-17');
INSERT INTO Experience (AMEASupEmail,description,startdate,enddate) VALUES ('stella@example.com','Dyslexia Supporter','2013-08-25','2020-10-03');
INSERT INTO Experience (AMEASupEmail,description,startdate,enddate) VALUES ('dimitra@example.com','Deaf Supporter-full time','2010-06-30','2012-06-30');
INSERT INTO Experience (AMEASupEmail,description,startdate,enddate) VALUES ('dimitra@example.com','Deaf Supporter-full time','2012-10-01','2020-10-01');
INSERT INTO Experience (AMEASupEmail,description,startdate,enddate) VALUES ('ioanna@example.com','Mobility-Impaired Supporter','2014-08-20','2016-10-15');
INSERT INTO Experience (AMEASupEmail,description,startdate,enddate) VALUES ('ioanna@example.com','Mobility-Impaired Supporter','2017-05-26','2018-09-10');
INSERT INTO Experience (AMEASupEmail,description,startdate,enddate) VALUES ('ioanna@example.com','Mobility-Impaired Supporter','2018-10-05','2020-12-13');
INSERT INTO Experience (AMEASupEmail,description,startdate,enddate) VALUES ('katerina@example.com','Blind Supporter','2008-03-18','2012-07-21');
INSERT INTO Experience (AMEASupEmail,description,startdate,enddate) VALUES ('katerina@example.com','Blind Supporter','2013-02-13','2016-10-29');
INSERT INTO Experience (AMEASupEmail,description,startdate,enddate) VALUES ('katerina@example.com','Blind Supporter','2016-11-20','2020-12-13');


INSERT INTO customer (`email`,`phone`, `password`,`name`, `surname`) VALUES ('ellie@gmail.com', 6983046683, 'ct376', 'Ellie', 'Golding');
INSERT INTO customer (`email`,`phone`, `password`,`name`, `surname`) VALUES ('mpapadopoulou@gmail.com', 6983046111, 'ct376', 'Marina', 'Papadopoulou');
INSERT INTO customer (`email`,`phone`, `password`,`name`, `surname`) VALUES ('xpappa@gmail.com', 6983046222, 'cf476', 'Xrisi', 'Pappa');
INSERT INTO customer (`email`,`phone`, `password`,`name`, `surname`) VALUES ('mblack@gmail.com', 6983046333, 'cttt6', 'Mike', 'Black');
INSERT INTO customer (`email`,`phone`, `password`,`name`, `surname`) VALUES ('jholder@gmail.com', 6983046444, '32376', 'Jason', 'Holder');

INSERT INTO ad (`id`,`customerEmail`, `startDate`,`endDate`, `service`, `disability`, `description`, `location`) VALUES ('1', 'ellie@gmail.com', '2021-1-12' , '2021-6-12','Helping young girl with homework', 'Autism', 
'I am looking for a qualified supporter to help my autistic niece with her homework, mostly greek language and english. On week days for two hours between 3-6 o clock.', 
'Haidari, Athens');
INSERT INTO ad (`id`,`customerEmail`, `startDate`,`endDate`, `service`, `disability`, `description`, `location`) 
VALUES ('2', 'mpapadopoulou@gmail.com', '2021-2-12', '2021-5-30','Helping elderly man at home', 'Alzheimer', 
'I am looking for a qualified supporter to help my father with alzheimer at home. Helping him taker his pills,  his pressure and cooking him lunch and dinner. 
Every day and form 12 to 8 o clock', 'Chalandri, Athens');
INSERT INTO ad (`id`,`customerEmail`, `startDate`,`endDate`, `service`, `disability`, `description`, `location`) 
VALUES ('3', 'xpappa@gmail.com', '2021-3-11', '2021-3-21','Accompanying blind person in a seminar in England', 'Blind', 
'I am looking for a qualified supporter to accompany my blind sister in a 10-day-seminar in Oxford, England in March 2021. Hotel and plane tickets covered.', 
'Kamara, Thessaloniki');
INSERT INTO ad (`id`,`customerEmail`, `startDate`,`endDate`, `service`, `disability`, `description`, `location`) 
VALUES ('4', 'mblack@gmail.com', '2021-4-11', '2021-4-14','Translating in sign language in an event', 'Deaf', 
'I am looking for a qualified supporter to translate in sign language in my Tedx Chania event. 30 hours of speeches for 3 days.', 
'Chania');
INSERT INTO ad (`id`,`customerEmail`, `startDate`,`endDate`, `service`, `disability`, `description`, `location`) 
VALUES ('5', 'jholder@gmail.com', '2021-4-11', '2021-6-21','Teaching sign language- private lessons', 'Deaf', 
'I am looking for a qualified teacher to teach me sign language. Two times a week for 2 hours.', 
'Patra');