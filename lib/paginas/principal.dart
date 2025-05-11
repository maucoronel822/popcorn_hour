import 'package:flutter/material.dart';

class Principal extends StatelessWidget{
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: 
    AppBar(
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
              'Bienvenido a Popcorn Hour',
              style: TextStyle(
                fontSize: 60,
                color: Color.fromARGB(255, 209, 206, 0),
              )
            ),
            Text(
              'Descubre y comparte reseñas de tus peliculas y series favoritas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '¡Inicia sesión para comenzar!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/TLOU.jpg', width: 150, height: 150),
                Image.asset('assets/breaking-bad.jpg', width: 150, height: 150),
                Image.asset('assets/black-mirror.jpg', width: 150, height: 150),
                Image.asset('assets/mickey-17.jpg', width: 150, height: 150),
              ],
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón de inicio de sesión
                Navigator.pushNamed(context, '/login');
              }, 
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                backgroundColor: Color.fromARGB(255, 143, 0, 55),
              ),
              child: Text('Inicia Sesión',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(
                  '¿No tienes una cuenta?',
                  style: TextStyle(color: Colors.white)
                ),
                SizedBox(width: 90),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    'Registrate',
                    style: TextStyle(
                      color: Color.fromARGB(255, 209, 206, 0),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  )
                )
              ]
            )
          ],
        ),
      )
    );
  }
}