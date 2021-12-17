from flask import Blueprint, render_template, request, flash, redirect, url_for
from .models import User
from . import db

auth = Blueprint('auth' __name__)


@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        user = User.query.filter_by(email=email).first()
        
        if user:
            if user.password == password:
                flash('Logged in successfully', category='success')
                return redirect(url_for('views.home'))
            else:
                flash('Incorrect password.', category='error')
        else:
            flash('Email does not exist.', category='error')
            
    return renger_template("login.html", boolean = True)
    

@auth.route('/logout')
def logout():
    return "<p>Logout</p>"

@auth.route('/sign-up', methods=['GET', 'POST'])
def sign_up():
    if request.method == 'POST':
        email = request.form.get('email')
        password1 = request.form.get('password1')
        password2 = request.form.get('password2')
        
        firstName = request.form.get('firstName')
        mInit = request.form.get('mInit')
        lastName = request.form.get('lastName')
        ucid = request.form.get('ucid')
        
        major = request.form.get('major')
        minor = request.form.get('minor')
        department = request.form.get('depertment')
        
        user = User.query.filter_by(email=email).first()
        
        if user:
            flash('Email already exists.', category='error')
        elif password1 != password2:
            flash('Passwords do not match.', category='error')
        else:
            #add user to database
            new_user(email=email, password=password1, firstName=firstName, mInit=mInit, lName=lName, ucid=ucid, major=major, minor=minor, department=department)
            db.session.add(new_user)
            db.session.commit()
            
            flash('Acount created!', category='success')
            return redirect(url_for('views.home'))
        
    return render_template("sign_up.html")

