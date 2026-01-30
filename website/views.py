from flask import Blueprint, render_template, request, flash
from .models import Participant
from . import db

views = Blueprint('views', __name__)

@views.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')

        # Basic validation
        if not name or not email:
            flash("Name and Email are required", category="error")
            return render_template("index.html")

        # Prevent duplicate submissions
        existing_participant = Participant.query.filter_by(email=email).first()
        if existing_participant:
            flash(
                "This email is already registered. Certificate will be sent after verification.",
                category="error"
            )
            return render_template("index.html")

        # Save participant to database
        participant = Participant(name=name, email=email)
        db.session.add(participant)
        db.session.commit()

        # Success page (certificate sent manually later)
        return render_template("success.html", name=name)

    return render_template("index.html")
