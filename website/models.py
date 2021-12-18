from . import db
from flask_login import UserMixin

class Person(db.Model, UserMixin):
    uid = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), unique=True)
    password = db.Column(db.String(100))
    fname = db.Column(db.String(25))
    minit = db.Column(db.String(1))
    lname = db.Column(db.String(25))
    major = db.Column(db.String(25))
    minor = db.Column(db.String(25))
    department = db.Column(db.String(25))
    
class Sched(db.Model):
    uid = db.Column(db.Integer, db.ForeignKey('person.uid'), primary_key=True)

class Course(db.Model):
    course_id = db.Column(db.String(7), primary_key=True)
    department = db.Column(db.String(25))

class Lecture_section(db.Model):
    course_id = db.Column(db.String(7), db.ForeignKey('course.course_id'), primary_key=True)
    sec_no = db.Column(db.Integer, primary_key=True)
    prof_uid = db.Column(db.Integer, db.ForeignKey('person.uid'))

class Lec_day(db.Model):
    course_id = db.Column(db.String(7), db.ForeignKey('lecture_section.course_id'), primary_key=True)
    sec_no = db.Column(db.Integer, db.ForeignKey('lecture_section.sec_no'), primary_key=True)
    weekday = db.Column(db.String(9), primary_key=True)
    daytime = db.Column(db.String(5))

class Lab_section(db.Model):
    course_id = db.Column(db.String(7), db.ForeignKey('course.course_id'), primary_key=True)
    sec_no = db.Column(db.Integer, primary_key=True)
    prof_uid = db.Column(db.Integer, db.ForeignKey('person.uid'))

class Lab_day(db.Model):
    course_id = db.Column(db.String(7), db.ForeignKey('lab_section.course_id'), primary_key=True)
    sec_no = db.Column(db.Integer, db.ForeignKey('lab_section.sec_no'), primary_key=True)
    weekday = db.Column(db.String(9), primary_key=True)
    daytime = db.Column(db.String(5))
    
class Tutorial_section(db.Model):
    course_id = db.Column(db.String(7), db.ForeignKey('course.course_id'), primary_key=True)
    sec_no = db.Column(db.Integer, primary_key=True)
    prof_uid = db.Column(db.Integer, db.ForeignKey('person.uid'))

class Tut_day(db.Model):
    course_id = db.Column(db.String(7), db.ForeignKey('tutorial_section.course_id'), primary_key=True)
    sec_no = db.Column(db.Integer, db.ForeignKey('tutorial_section.sec_no'), primary_key=True)
    weekday = db.Column(db.String(9), primary_key=True)
    daytime = db.Column(db.String(5))

class Friends(db.Model):
    friend_one = db.Column(db.Integer, db.ForeignKey('person.uid'), primary_key=True)
    friend_two = db.Column(db.Integer, db.ForeignKey('person.uid'), primary_key=True)
    
class Sched_course(db.Model):
    uid = db.Column(db.Integer, db.ForeignKey('person.uid'), primary_key=True)
    course_id = db.Column(db.String(7), db.ForeignKey('course.course_id'), primary_key=True)

class Sched_lec(db.Model):
    uid = db.Column(db.Integer, db.ForeignKey('person.uid'), primary_key=True)
    course_id = db.Column(db.String(7), db.ForeignKey('lecture_section.course_id'), primary_key=True)
    lec_sec = db.Column(db.Integer, db.ForeignKey('lecture_section.sec_no'), primary_key=True)
    
class Sched_lab(db.Model):
    uid = db.Column(db.Integer, db.ForeignKey('person.uid'), primary_key=True)
    course_id = db.Column(db.String(7), db.ForeignKey('lab_section.course_id'), primary_key=True)
    lec_sec = db.Column(db.Integer, db.ForeignKey('lab_section.sec_no'), primary_key=True)

class Sched_tut(db.Model):
    uid = db.Column(db.Integer, db.ForeignKey('person.uid'), primary_key=True)
    course_id = db.Column(db.String(7), db.ForeignKey('tutorial_section.course_id'), primary_key=True)
    lec_sec = db.Column(db.Integer, db.ForeignKey('tutorial_section.sec_no'), primary_key=True)