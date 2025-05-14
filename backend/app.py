from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

# Configuración de la base de datos PostgreSQL
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://your_username:your_password@localhost/popcorn_hour'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Inicializar la base de datos
db = SQLAlchemy(app)

from routes import *
from flask_cors import CORS

CORS(app)

if __name__ == '__main__':
    app.run(debug=True)
    
# This code is a Flask application that provides a RESTful API for managing movies, reviews, and users in a PostgreSQL database.
# It includes routes for creating, reading, updating, and deleting movies, reviews, and users.
# The application uses SQLAlchemy for database interactions and defines models for User, Movie, and Review.
# The application is configured to run in debug mode, which allows for easier development and debugging.