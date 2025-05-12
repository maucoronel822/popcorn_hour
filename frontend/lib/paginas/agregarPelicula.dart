import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage>{

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
                style: TextStyle(
                color: Colors.white
                ),
                decoration: InputDecoration(
                labelText: 'Titulo', fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                    ),
                  )
                )
              )
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                style: TextStyle(
                color: Colors.white
                ),
                decoration: InputDecoration(
                labelText: 'Año', fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                    ),
                  )
                )
              )
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                style: TextStyle(
                color: Colors.white
                ),
                decoration: InputDecoration(
                labelText: 'Director', fillColor: Colors.white,
                border: OutlineInputBorder()
                )
              )
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                style: TextStyle(
                color: Colors.white
                ),
                decoration: InputDecoration(
                labelText: 'Sinopsis', fillColor: Colors.white,
                border: OutlineInputBorder()
                )
              )
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/agregarPelicula');
                // Aquí puedes agregar la lógica para agregar la película
                // Por ejemplo, enviar los datos a un servidor o guardarlos localmente
                // Luego, puedes navegar a otra página o mostrar un mensaje de éxito
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                backgroundColor: Color.fromARGB(255, 143, 0, 55),
              ),
              child: Text('Agregar Película',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ] // Children
        )
      ),
    );
  }
}