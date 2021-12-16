DROP DATABASE IF EXISTS PROJECT;
CREATE DATABASE PROJECT; 
USE PROJECT;


DROP TABLE IF EXISTS PERSON;
CREATE TABLE PERSON (
	UCID			varchar(9) not null,
	Fname			varchar(25),
    Minit			varchar(1),
    Lname			varchar(25),
	Major			varchar(25),
    Minor			varchar(25),
    Department		varchar(25),
	primary key (UCID)
);

DROP TABLE IF EXISTS SCHED;
CREATE TABLE SCHED (
	UCID			varchar(9) not null,
    primary key (UCID),
    foreign key (UCID) references PERSON(UCID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS COURSE;
CREATE TABLE COURSE (
	Course_id		char(7) not null,
    Department		varchar(25),
    primary key (Course_id)
);

DROP TABLE IF EXISTS LECTURE_SECTION;
CREATE TABLE LECTURE_SECTION (
	Course_id		char(7) not null,
    Sec_no			integer not null,
    Prof_ucid		varchar(9),
    primary key (Course_id, Sec_no),
    foreign key (Course_id) references COURSE(Course_id) ON UPDATE CASCADE,
    foreign key (Prof_ucid) references PERSON(UCID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS LEC_DAY;
CREATE TABLE LEC_DAY (
	Course_id		char(7) not null,
    Sec_no			integer not null,
    Weekday			varchar(9) not null,
    Daytime			char(5),
    primary key (Course_id, Sec_no, Weekday),
    foreign key (Course_id, Sec_no) references LECTURE_SECTION(Course_id, Sec_no) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS LAB_SECTION;
CREATE TABLE LAB_SECTION (
	Course_id		char(7) not null,
    Sec_no			integer not null,
    Instructor_ucid	varchar(9),
    primary key (Course_id, Sec_no),
    foreign key (Course_id) references COURSE(Course_id) ON UPDATE CASCADE,
    foreign key (Instructor_ucid) references PERSON(UCID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS LAB_DAY;
CREATE TABLE LAB_DAY (
	Course_id		char(7) not null,
    Sec_no			integer not null,
    Weekday			varchar(9) not null,
    Daytime			char(5),
    primary key (Course_id, Sec_no, Weekday),
    foreign key (Course_id, Sec_no) references LECTURE_SECTION(Course_id, Sec_no) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS TUTORIAL_SECTION;
CREATE TABLE TUTORIAL_SECTION (
	Course_id		char(7) not null,
    Sec_no			integer not null,
    Instructor_ucid	varchar(9),
    primary key (Course_id, Sec_no),
    foreign key (Course_id) references COURSE(Course_id) ON UPDATE CASCADE,
    foreign key (Instructor_ucid) references PERSON(UCID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS TUT_DAY;
CREATE TABLE TUT_DAY (
	Course_id		char(7) not null,
    Sec_no			integer not null,
    Weekday			varchar(9) not null,
    Daytime			char(5),
    primary key (Course_id, Sec_no, Weekday),
    foreign key (Course_id, Sec_no) references LECTURE_SECTION(Course_id, Sec_no) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS FRIENDS;
CREATE TABLE FRIENDS (
	Friend_one		varchar(9) not null,
	Friend_two		varchar(9) not null,
    primary key (Friend_one, Friend_two),
    foreign key (Friend_one) references PERSON(UCID) ON UPDATE CASCADE,
    foreign key (Friend_two) references PERSON(UCID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SCHED_COURSE;
CREATE TABLE SCHED_COURSE (
	UCID			varchar(9) not null,
    Course_id		char(7) not null,
    primary key (UCID, Course_id),
    foreign key (UCID) references PERSON(UCID) ON UPDATE CASCADE,
    foreign key (Course_id) references COURSE(Course_id) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SCHED_LEC;
CREATE TABLE SCHED_LEC (
	UCID			varchar(9) not null,
    Lec_sec			integer not null,
    primary key (UCID, Lec_sec),
    foreign key (UCID) references PERSON(UCID) ON UPDATE CASCADE,
    foreign key (Lec_sec) references LECTURE_SECTION(Sec_no) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SCHED_LAB;
CREATE TABLE SCHED_LAB (
	UCID			varchar(9) not null,
    Lab_sec			integer not null,
    primary key (UCID, Lab_sec),
    foreign key (UCID) references PERSON(UCID) ON UPDATE CASCADE,
    foreign key (Lab_sec) references LAB_SECTION(Sec_no) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SCHED_TUT;
CREATE TABLE SCHED_TUT (
	UCID			varchar(9) not null,
    Tut_sec			integer not null,
    primary key (UCID, Tut_sec),
    foreign key (UCID) references PERSON(UCID) ON UPDATE CASCADE,
    foreign key (tut_sec) references TUTORIAL_SECTION(Sec_no) ON UPDATE CASCADE
);