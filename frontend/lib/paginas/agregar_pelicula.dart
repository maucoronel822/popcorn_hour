import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AgregarPelicula extends StatefulWidget {
  const AgregarPelicula({super.key});

  @override
  State<AgregarPelicula> createState() {
    return _AgregarPeliculaState();
  }
}

class _AgregarPeliculaState extends State<AgregarPelicula>{
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _anioController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _directorController = TextEditingController();
  final TextEditingController _sinopsisController = TextEditingController();
  final TextEditingController _calificacionController = TextEditingController();


  Future<void> agregarPelicula() async {
    final url = Uri.parse('http://127.0.0.1:5000/peliculas');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'titulo': _tituloController.text,
        'anio': _anioController.text,
        'genero': _generoController.text,
        'director': _directorController.text,
        'sinopsis': _sinopsisController.text,
        'calificacion': _calificacionController.text,
      }),
    );

    if (response.statusCode == 201) {
      _tituloController.clear();
      _anioController.clear();
      _generoController.clear();
      _directorController.clear();
      _sinopsisController.clear();
      _calificacionController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Película agregada exitosamente')),
      );
      Navigator.pop(context);
    } else if (response.statusCode == 400) {
      final error = json.decode(response.body)['error'];
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(error),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al agregar película')),
      );
    }
  }

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Agrega una película',
            style: TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 209, 206, 0),
            )
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 350,
            height: 70,
            child: TextField(
              controller: _tituloController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 350,
            height: 70,
            child: TextField(
              controller: _anioController,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Año',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 350,
            height: 70,
            child: TextField(
              controller: _generoController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Género',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 350,
            height: 70,
            child: TextField(
              controller: _directorController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Director',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 350,
            height: 100,
            child: TextField(
              controller: _sinopsisController,
              style: TextStyle(color: Colors.white),
              maxLines: 8,
              minLines: 1,
              maxLength: 500,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Sinopsis',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 350,
            height: 70,
            child: TextField(
              controller: _calificacionController,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Calificación',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              agregarPelicula();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200, 50),
              backgroundColor: Color.fromARGB(255, 143, 0, 55),
            ),
            child: Text(
              'Agregar Película',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}