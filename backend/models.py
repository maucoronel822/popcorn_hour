from app import db

class Usuarios(db.Model):
    __tablename__ = 'usuarios'
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(120), unique=True,nullable=False)
    nombre_usuario = db.Column(db.String(50), unique=True, nullable=False)
    contrasena = db.Column(db.String(200), nullable=False)
    fecha_registro = db.Column(db.DateTime, nullable=False)

    def __repr__(self):
        return f'<Usuario {self.nombre}>'

class Director(db.Model):
    __tablename__ = 'directores'
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(50), nullable=False)
    apellido = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return f'<Director {self.nombre} {self.apellido}>'

class Peliculas(db.Model):
    __tablename__ = 'peliculas'
    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(100), nullable=False)
    anio = db.Column(db.Integer, nullable=False)
    genero = db.Column(db.String(50), nullable=False)
    director_id = db.Column(db.Integer, db.ForeignKey('directores.id'), nullable=False)
    director = db.relationship('Director', backref=db.backref('peliculas', lazy=True))
    sinopsis = db.Column(db.Text, nullable=False)
    calificacion = db.Column(db.Float, nullable=False)
    fecha_agregado = db.Column(db.DateTime, nullable=False)

    def __repr__(self):
        return f'<Pelicula {self.titulo}>'

class Reseñas(db.Model):
    __tablename__ = 'reseñas'
    id = db.Column(db.Integer, primary_key=True)
    pelicula_id = db.Column(db.Integer, db.ForeignKey('peliculas.id'), nullable=False)
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuarios.id'), nullable=False)
    contenido = db.Column(db.Text, nullable=False)
    calificacion = db.Column(db.Float, nullable=False)
    fecha_creacion = db.Column(db.DateTime, nullable=False)

    def __repr__(self):
        return f'<Reseña {self.id}>'