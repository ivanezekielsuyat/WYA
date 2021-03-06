DROP DATABASE IF EXISTS PROJECT;
CREATE DATABASE PROJECT; 
USE PROJECT;


DROP TABLE IF EXISTS PERSON;
CREATE TABLE PERSON (
	Username		varchar(100) NOT NULL UNIQUE,
	Password		varchar(100) NOT NULL,
	UID			integer NOT NULL AUTO_INCREMENT,
	Fname			varchar(25),
	Minit			char(1),
	Lname			varchar(25),
	Major			varchar(25),
	Minor			varchar(25),
	Department		varchar(25),
	primary key (UID)
);

DROP TABLE IF EXISTS SCHED;
CREATE TABLE SCHED (
	UID			integer NOT NULL,
	primary key (UID),
	foreign key (UID) references PERSON(UID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS COURSE;
CREATE TABLE COURSE (
	Course_id		char(7) NOT NULL,
	Department		varchar(25),
	primary key (Course_id)
);

DROP TABLE IF EXISTS LECTURE_SECTION;
CREATE TABLE LECTURE_SECTION (
	Course_id		char(7) NOT NULL,
	Sec_no			integer NOT NULL,
	Prof_uid		integer,
	primary key (Course_id, Sec_no),
	foreign key (Course_id) references COURSE(Course_id) ON UPDATE CASCADE,
	foreign key (Prof_uid) references PERSON(UID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS LEC_DAY;
CREATE TABLE LEC_DAY (
	Course_id		char(7) NOT NULL,
	Sec_no			integer NOT NULL,
	Weekday			varchar(9) NOT NULL,
	Start_time		integer,
	End_time		integer,
	primary key (Course_id, Sec_no, Weekday),
	foreign key (Course_id, Sec_no) references LECTURE_SECTION(Course_id, Sec_no) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS LAB_SECTION;
CREATE TABLE LAB_SECTION (
	Course_id		char(7) NOT NULL,
	Sec_no			integer NOT NULL,
	Instructor_uid		integer,
	primary key (Course_id, Sec_no),
	foreign key (Course_id) references COURSE(Course_id) ON UPDATE CASCADE,
	foreign key (Instructor_uid) references PERSON(UID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS LAB_DAY;
CREATE TABLE LAB_DAY (
	Course_id		char(7) NOT NULL,
	Sec_no			integer NOT NULL,
	Weekday			varchar(9) NOT NULL,
	Start_time		integer,
	End_time		integer,
	primary key (Course_id, Sec_no, Weekday),
	foreign key (Course_id, Sec_no) references LAB_SECTION(Course_id, Sec_no) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS TUTORIAL_SECTION;
CREATE TABLE TUTORIAL_SECTION (
	Course_id		char(7) NOT NULL,
	Sec_no			integer NOT NULL,
	Instructor_uid		integer,
	primary key (Course_id, Sec_no),
	foreign key (Course_id) references COURSE(Course_id) ON UPDATE CASCADE,
	foreign key (Instructor_uid) references PERSON(UID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS TUT_DAY;
CREATE TABLE TUT_DAY (
	Course_id		char(7) NOT NULL,
	Sec_no			integer NOT NULL,
	Weekday			varchar(9) NOT NULL,
	Start_time		integer,
	End_time		integer,
	primary key (Course_id, Sec_no, Weekday),
	foreign key (Course_id, Sec_no) references TUTORIAL_SECTION(Course_id, Sec_no) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS FRIENDS;
CREATE TABLE FRIENDS (
	Friend_one		integer NOT NULL,
	Friend_two		integer NOT NULL,
	primary key (Friend_one, Friend_two),
	foreign key (Friend_one) references PERSON(UID) ON UPDATE CASCADE,
	foreign key (Friend_two) references PERSON(UID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SCHED_COURSE;
CREATE TABLE SCHED_COURSE (
	UID			integer NOT NULL,
	Course_id		char(7) NOT NULL,
	primary key (UID, Course_id),
	foreign key (UID) references PERSON(UID) ON UPDATE CASCADE,
	foreign key (Course_id) references COURSE(Course_id) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SCHED_LEC;
CREATE TABLE SCHED_LEC (
	UID			integer NOT NULL,
	Course_id		char(7) NOT NULL,
	Lec_sec			integer NOT NULL,
	primary key (UID, Course_id, Lec_sec),
	foreign key (UID) references PERSON(UID) ON UPDATE CASCADE,
	foreign key (Course_id, Lec_sec) references LECTURE_SECTION(Course_id, Sec_no) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SCHED_LAB;
CREATE TABLE SCHED_LAB (
	UID			integer NOT NULL,
	Course_id		char(7) NOT NULL,
	Lab_sec			integer NOT NULL,
	primary key (UID, Course_id, Lab_sec),
	foreign key (UID) references PERSON(UID) ON UPDATE CASCADE,
	foreign key (Course_id, Lab_sec) references LAB_SECTION(Course_id, Sec_no) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SCHED_TUT;
CREATE TABLE SCHED_TUT (
	UID			integer NOT NULL,
	Course_id		char(7) NOT NULL,
	Tut_sec			integer NOT NULL,
	primary key (UID, Course_id, Tut_sec),
	foreign key (UID) references PERSON(UID) ON UPDATE CASCADE,
	foreign key (Course_id, Tut_sec) references TUTORIAL_SECTION(Course_id, Sec_no) ON UPDATE CASCADE
);
