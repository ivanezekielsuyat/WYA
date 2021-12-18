from flask import Blueprint, render_template, request, redirect, url_for
from flask.helpers import flash
from .models import Person
from . import db
from . import views
from flask_login import login_user, login_required, logout_user, current_user

auth = Blueprint('auth', __name__)

@auth.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('LoginUsernameInput')
        password = request.form.get('LoginPasswordInput')

        user = Person.query.filter_by(username=username).first()
        if user:
            if user.password == password:
                login_user(user, remember=True)
                return redirect(url_for('views.schedule'))
            else:
                flash('Incorrect Password.', category='error')
        else:
            flash('This user does not exist.', category='error')

    return render_template("login.html")

@auth.route('/sign-up', methods=['GET', 'POST'])
def sign_up():
    if request.method == 'POST':
        username = request.form.get('CreateUsernameInput')
        password = request.form.get('CreatePasswordInput')
        UCID = request.form.get('CreateUCIDInput')
        fname = request.form.get('CreateFNInput')
        minit = request.form.get('CreateMIntInput')
        lname = request.form.get('CreateLNInput')
        department = request.form.get('CreateDeptInput')
        major = request.form.get('CreateMjrInput')
        minor = request.form.get('CreateMinorInput')

        user = Person.query.filter_by(username=username).first()
        if user:
            flash('This username is taken.', category='error')
        else:
            new_user = Person(username=username, password=password, fname=fname, minit=minit, lname=lname, department=department, major=major, minor=minor)
            db.session.add(new_user)
            db.session.commit()
            login_user(user, remember=True)
            return redirect(url_for('views.schedule'))

    return render_template("sign-up.html")


