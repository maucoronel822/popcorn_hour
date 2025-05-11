from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

# Configuración de la base de datos PostgreSQL
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://your_username:your_password@localhost/popcorn_hour'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Inicializar la base de datos
db = SQLAlchemy(app)
from models import Usuarios, Peliculas, Director, Reseñas
from datetime import datetime
from flask import request, jsonify
from flask_cors import CORS

# Habilitar CORS para permitir solicitudes desde otros dominios
CORS(app)

@app.route('/')
def index():
    return "Welcome to the Popcorn Hour API!"

@app.route('/peliculas', methods=['GET'])
def obtener_peliculas():
    peliculas = Peliculas.query.all()
    return {'peliculas': [pelicula.to_dict() for pelicula in peliculas]}

@app.route('/peliculas/<int:pelicula_id>', methods=['GET'])
def obtener_pelicula(pelicula_id):
    pelicula = Peliculas.query.get_or_404(pelicula_id)
    return pelicula.to_dict()

@app.route('/peliculas', methods=['POST'])
def agregar_pelicula():
    data = request.get_json()
    new_movie = Peliculas(
        titulo=data['titulo'],
        anio=data['anio'],
        genero=data['genero'],
        director_id=data['director_id'],
        sinopsis=data['sinopsis'],
        calificacion=data['calificacion'],
        fecha_agregado=datetime.timestamp()
    )
    db.session.add(new_movie)
    db.session.commit()
    return new_movie.to_dict(), 201

@app.route('/peliculas/<int:pelicula_id>', methods=['PUT'])
def actualizar_pelicula(pelicula_id):
    data = request.get_json()
    pelicula = Peliculas.query.get_or_404(pelicula_id)
    pelicula.titulo = data['title']
    pelicula.anio = data['anio']
    pelicula.genero = data['genero']
    pelicula.director_id = data['director_id']
    pelicula.sinopsis = data['sinopsis']
    pelicula.calificacion = data['calificacion']
    
    db.session.commit()
    return pelicula.to_dict()

@app.route('/peliculas/<int:pelicula_id>', methods=['DELETE'])
def eliminar_pelicula(pelicula_id):
    pelicula = Peliculas.query.get_or_404(pelicula_id)
    db.session.delete(pelicula)
    db.session.commit()
    return '', 204

@app.route('/resenias', methods=['GET'])
def obtener_resenias():
    resenias = Reseñas.query.all()
    return {'resenias': [resenia.to_dict() for resenia in resenias]}

@app.route('/resenias/<int:resenia_id>', methods=['GET'])
def obtener_resenia(resenia_id):
    resenia = Reseñas.query.get_or_404(resenia_id)
    return resenia.to_dict()

@app.route('/resenia', methods=['POST'])
def add_review():
    data = request.get_json()
    nueva_resenia = Reseñas(
        pelicula_id=data['pelicula_id'],
        usuario_id=data['usuario_id'],
        contenido=data['contenido'],
        calificacion=data['calificacion'],
        fecha_creacion=datetime.utcnow()
    )
    db.session.add(nueva_resenia)
    db.session.commit()
    return nueva_resenia.to_dict(), 201

@app.route('/resenias/<int:resenia_id>', methods=['PUT'])
def actualizar_resenia(resenia_id):
    data = request.get_json()
    resenia = Reseñas.query.get_or_404(resenia_id)
    resenia.pelicula_id = data['pelicula_id']  
    resenia.usuario_id = data['usuario_id']
    resenia.contenido = data['contenido']
    resenia.calificacion = data['calificacion']
    db.session.commit()
    return resenia.to_dict()

@app.route('/resenias/<int:resenia_id>', methods=['DELETE'])
def eliminar_resenia(resenia_id):
    resenia = Reseñas.query.get_or_404(resenia_id)
    db.session.delete(resenia)
    db.session.commit()
    return '', 204

@app.route('/usuarios', methods=['GET'])
def obtener_usuarios():
    usuarios = Usuarios.query.all()
    return {'usuarios': [usuario.to_dict() for usuario in usuarios]}

@app.route('/usuarios/<int:usuario_id>', methods=['GET'])
def get_user(user_id):
    usuario = Usuarios.query.get_or_404(user_id)
    return usuario.to_dict()

@app.route('/usuarios', methods=['POST'])
def agregar_usuario():
    data = request.get_json()
    nuevo_usuario = Usuarios(
        nombre=data['nombre'],
        email=data['email'],   
        nombre_usuario=data['nombre_usuario'],
        contrasena=data['contrasena'],
        fecha_registro=datetime.timestamp()
    )
    db.session.add(nuevo_usuario)
    db.session.commit()
    return nuevo_usuario.to_dict(), 201

@app.route('/usuarios/<int:usuario_id>', methods=['PUT'])
def update_user(usuario_id):
    data = request.get_json()
    usuario = Usuarios.query.get_or_404(usuario_id)
    usuario.nombre = data['nombre']
    usuario.email = data['email']  
    usuario.nombre_usuario = data['nombre_usuario']
    usuario.contrasena = data['contrasena']
    db.session.commit()
    return usuario.to_dict()

@app.route('/usuarios/<int:usuario_id>', methods=['DELETE'])
def delete_user(usuario_id):
    usuario = Usuarios.query.get_or_404(usuario_id)
    db.session.delete(usuario)
    db.session.commit()
    return '', 204

if __name__ == '__main__':
    app.run(debug=True)
    
# This code is a Flask application that provides a RESTful API for managing movies, reviews, and users in a PostgreSQL database.
# It includes routes for creating, reading, updating, and deleting movies, reviews, and users.
# The application uses SQLAlchemy for database interactions and defines models for User, Movie, and Review.
# The application is configured to run in debug mode, which allows for easier development and debugging.