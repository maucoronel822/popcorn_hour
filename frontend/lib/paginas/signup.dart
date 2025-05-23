import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage>{
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  // Método para manejar el registro de usuario

  Future<void> registrarUsuario() async {
    final url = Uri.parse('http://127.0.0.1:5000/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'nombre': _nombreController.text,
        'apellido': _apellidoController.text,
        'nombre_usuario': _usuarioController.text,
        'email': _emailController.text,
        'contrasena': _contrasenaController.text,
      })
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Registro exitoso
      Navigator.pushNamed(context, '/login');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuario registrado exitosamente')),
      );
    } else {
      // Manejo de errores
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar usuario')),
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
              'Registra una cuenta',
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
                controller: _nombreController,
                style: TextStyle(
                color: Colors.white
                ),
                decoration: InputDecoration(
                icon:Icon(Icons.person, color: const Color.fromARGB(255, 255, 255, 255)),
                labelText: 'Nombre', fillColor: Colors.white,
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
                controller: _apellidoController,
                style: TextStyle(
                color: Colors.white
                ),
                decoration: InputDecoration(
                icon:Icon(Icons.person, color: const Color.fromARGB(255, 255, 255, 255)),
                labelText: 'Apellido', fillColor: Colors.white,
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
                controller: _usuarioController,
                style: TextStyle(
                color: Colors.white
                ),
                decoration: InputDecoration(
                icon:Icon(Icons.account_circle, color: const Color.fromARGB(255, 255, 255, 255)),
                labelText: 'Nombre de usuario', fillColor: Colors.white,
                border: OutlineInputBorder()
                )
              )
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                controller: _emailController,
                style: TextStyle(
                color: Colors.white
                ),
                decoration: InputDecoration(
                icon:Icon(Icons.email, color: const Color.fromARGB(255, 255, 255, 255)),
                labelText: 'Correo electrónico', fillColor: Colors.white,
                border: OutlineInputBorder()
                )
              )
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                controller: _contrasenaController,
                style: TextStyle(
                color: Colors.white
                ),
                decoration: InputDecoration(
                icon:Icon(Icons.lock, color: const Color.fromARGB(255, 255, 255, 255)),
                labelText: 'Contraseña', fillColor: Colors.white,
                border: OutlineInputBorder()
                ),
                obscureText: true,
              )
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                registrarUsuario();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                backgroundColor: Color.fromARGB(255, 143, 0, 55),
              ),
              child: Text('Registrate',
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