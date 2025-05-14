from app import app, db
from models import Usuarios, Peliculas, Resenias
from datetime import datetime
from flask import request, jsonify

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
        director=data['director'],
        sinopsis=data['sinopsis'],
        calificacion=data['calificacion'],
        fecha_agregado=datetime.utcnow()
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
    pelicula.director = data['director']
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
    resenias = Resenias.query.all()
    return {'resenias': [resenia.to_dict() for resenia in resenias]}

@app.route('/resenias/<int:resenia_id>', methods=['GET'])
def obtener_resenia(resenia_id):
    resenia = Resenias.query.get_or_404(resenia_id)
    return resenia.to_dict()

@app.route('/resenia', methods=['POST'])
def add_review():
    data = request.get_json()
    nueva_resenia = Resenias(
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
    resenia = Resenias.query.get_or_404(resenia_id)
    resenia.pelicula_id = data['pelicula_id']  
    resenia.usuario_id = data['usuario_id']
    resenia.contenido = data['contenido']
    resenia.calificacion = data['calificacion']
    db.session.commit()
    return resenia.to_dict()

@app.route('/resenias/<int:resenia_id>', methods=['DELETE'])
def eliminar_resenia(resenia_id):
    resenia = Resenias.query.get_or_404(resenia_id)
    db.session.delete(resenia)
    db.session.commit()
    return '', 204

@app.route('/usuarios', methods=['GET'])
def obtener_usuarios():
    usuarios = Usuarios.query.all()
    return {'usuarios': [usuario.to_dict() for usuario in usuarios]}

@app.route('/usuarios/<int:usuario_id>', methods=['GET'])
def get_user(usuario_id):
    usuario = Usuarios.query.get_or_404(usuario_id)
    return usuario.to_dict()

@app.route('/usuarios', methods=['POST'])
def agregar_usuario():
    data = request.get_json()
    nuevo_usuario = Usuarios(
        nombre=data['nombre'],
        email=data['email'],   
        nombre_usuario=data['nombre_usuario'],
        contrasena=data['contrasena'],
        fecha_registro=datetime.utcnow()
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