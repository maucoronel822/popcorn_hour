import 'package:flutter/material.dart';

class Pelicula extends StatefulWidget {
  const Pelicula({super.key});

  @override
  State<Pelicula> createState() {
    return _Pelicula();
  }
}

class _Pelicula extends State<Pelicula>{
  // Variables para almacenar los datos de la película
  String titulo = '';
  String sinopsis = '';
  double calificacion = 0.0;
  String usuario = '';
  String resena = '';


  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: Text (
        'Popcorn Hour',
        style: TextStyle(color: Colors.white)),
      backgroundColor: Color.fromARGB(255, 143, 0, 55),
      shadowColor: Colors.black,
      elevation: 10,
      actions: [
        IconButton(
          icon:Icon(Icons.account_circle, color: Colors.white),
          onPressed: () {
            // Acción al presionar el botón de perfil
            Navigator.pushNamed(context, '/perfil');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre de la película seleccionada',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 209, 206, 0),
              )
            ),
            SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text('Calif.',
                      style: TextStyle(fontSize: 50,color: Color.fromARGB(255, 209, 206, 0))
                      ),
                    ),
                    Text('Sinopsis de la película',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                  )
                ),
              ],
            ),
            // Aqui van los containers con cada una de las reseñas de cada usuario por pelicula
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Usuario 1',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Esta es la reseña de la película por el usuario 1.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Usuario 2',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Esta es la sinopsis de la película por el usuario 2.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}