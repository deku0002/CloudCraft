from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)

    # -------------------------
    # Basic Flask Config
    # -------------------------
    app.config['SECRET_KEY'] = "postgres"

    # -------------------------
    # Database Config
    # Local  -> SQLite
    # Cloud  -> PostgreSQL (RDS) via DATABASE_URL
    # -------------------------
    app.config['SQLALCHEMY_DATABASE_URI'] = (
    "postgresql://postgres:postgres@database-1.cdecyo464bcu.ap-south-1.rds.amazonaws.com"
)

    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    # -------------------------
    # Init Extensions
    # -------------------------
    db.init_app(app)

    # -------------------------
    # Register Blueprints
    # -------------------------
    from .views import views
    app.register_blueprint(views)

    # -------------------------
    # Create DB Tables
    # -------------------------
    with app.app_context():
        db.create_all()
        print("✅ Database tables ensured")

    return app
