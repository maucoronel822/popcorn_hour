from app import db
from datetime import datetime


class Usuarios(db.Model):
    __tablename__ = 'usuarios'
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(50), nullable=False)
    apellido = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(120), unique=True,nullable=False)
    nombre_usuario = db.Column(db.String(50), unique=True, nullable=False)
    contrasena = db.Column(db.String(200), nullable=False)
    fecha_registro = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)


    def __repr__(self):
        return f'<Usuario {self.nombre}>'

class Peliculas(db.Model):
    __tablename__ = 'peliculas'

    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(255), nullable=False)
    anio = db.Column(db.Integer, nullable=False)
    genero = db.Column(db.String(100), nullable=False)
    director = db.Column(db.String(255), nullable=False)
    sinopsis = db.Column(db.Text, nullable=False)
    calificacion = db.Column(db.Float, nullable=False)
    fecha_agregado = db.Column(db.DateTime, default=datetime.utcnow)

    def to_dict(self):
        return {
            'id': self.id,
            'titulo': self.titulo,
            'anio': self.anio,
            'genero': self.genero,
            'director': self.director,
            'sinopsis': self.sinopsis,
            'calificacion': self.calificacion,
            'fecha_agregado': self.fecha_agregado.isoformat() if self.fecha_agregado else None
        }


class Resenias(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    pelicula_id = db.Column(db.Integer, db.ForeignKey('peliculas.id'), nullable=False)
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuarios.id'), nullable=False)
    contenido = db.Column(db.Text, nullable=False)
    calificacion = db.Column(db.Float, nullable=False)
    fecha_creacion = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

    def __repr__(self):
        return f'<Reseña {self.id}>'