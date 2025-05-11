import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{

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
            Navigator.pushNamed(context, '/user');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Inicio de Sesión',
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
                icon:Icon(Icons.email, color: const Color.fromARGB(255, 255, 255, 255)),
                labelText: 'Correo Electrónico', fillColor: Colors.white,
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
                icon:Icon(Icons.lock, color: const Color.fromARGB(255, 255, 255, 255)),
                labelText: 'Contraseña', fillColor: Colors.white,
                border: OutlineInputBorder()
                )
              )
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/user');
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
          ] // Children
        )
      )
    );
  }
}