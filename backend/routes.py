from app import app, db
from models import Usuarios, Peliculas, Resenias
from datetime import datetime
from flask import request, jsonify

# Habilitar CORS para permitir solicitudes desde otros dominios

@app.route('/')
def index():
    return "Welcome to the Popcorn Hour API!"

@app.route('/login', methods = ['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    contrasena = data.get('contrasena')

    usuario = Usuarios.query.filter_by(email=email).first()
    if usuario and usuario.contrasena == contrasena:
        return jsonify({'message': 'Login exitoso', 'usuario_id': usuario.id}), 200
    else:
        return jsonify({'error': 'Credenciales inválidas'}), 401

@app.route("/signup", methods=["POST"])
def signup():
    data = request.get_json()
    nombre = data.get("nombre")
    apellido = data.get("apellido")
    nombre_usuario = data.get("nombre_usuario")
    email = data.get("email")
    contrasena = data.get("contrasena")

    if Usuarios.query.filter_by(email=email).first():
        return jsonify({"mensaje": "Correo ya registrado"}), 400

    nuevo_usuario = Usuarios(
        nombre=nombre,
        apellido=apellido,
        email=email,
        nombre_usuario=nombre_usuario,
        contrasena=contrasena,
        fecha_registro=datetime.utcnow()
    )

    db.session.add(nuevo_usuario)
    db.session.commit()

    return jsonify({"mensaje": "Usuario registrado correctamente"}), 201

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

    campos_requeridos = ['titulo', 'anio', 'genero', 'director', 'sinopsis', 'calificacion']
    for campo in campos_requeridos:
        if campo not in data or data[campo] == '':
            return jsonify({'error': f'El campo "{campo}" es obligatorio y no puede estar vacío'}), 400

    try:
        anio = int(data['anio'])
        calificacion = float(data['calificacion'])
    except ValueError:
        return jsonify({'error': 'El campo "anio" debe ser un número entero y "calificacion" debe ser un número decimal'}), 400

    try:
        new_movie = Peliculas(
            titulo=data['titulo'],
            anio=anio,
            genero=data['genero'],
            director=data['director'],
            sinopsis=data['sinopsis'],
            calificacion=calificacion,
            fecha_agregado=datetime.utcnow()
        )
        db.session.add(new_movie)
        db.session.commit()
        return jsonify(new_movie.to_dict()), 201

    except Exception as e:
        db.session.rollback()
        return jsonify({'error': str(e)}), 500

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