import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  Future <void>  loginUsuario(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': _emailController.text,
        'contrasena': _contrasenaController.text,
      }),
    );
    if (response.statusCode == 200) {
    // Si la respuesta es exitosa, navega a la página de usuario
    final data = json.decode(response.body);
    final usuarioID = data['usuario_id'];
    Navigator.pushNamed(context, '/user');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Inicio de sesión exitoso')),
    );
    } else if (response.statusCode == 401) {
      final error = json.decode(response.body)['error'];
      showDialog(
      context: context, 
      builder: (context) => AlertDialog(
      title: Text('Error'),
      content: Text(error),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
      ]
    )
  );
    } else {
    // Si la respuesta no es exitosa, muestra un mensaje de error
    final error = json.decode(response.body)['error'];
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(error),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
          ]
        )
      );
    }
  }

  // Método para manejar el inicio de sesión
  bool obscurecerPass = true;

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
                controller: _emailController,
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
                )              )
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                controller: _contrasenaController,
                style: TextStyle(
                color: Colors.white),
                obscureText: obscurecerPass,
                decoration: InputDecoration(
                icon:Icon(Icons.lock, color: const Color.fromARGB(255, 255, 255, 255)),
                labelText: 'Contraseña', fillColor: Colors.white,
                border: OutlineInputBorder(),
                suffixIcon: (IconButton(
                  onPressed: () {
                    setState(() {
                      obscurecerPass = !obscurecerPass;
                    });
                  },
                  icon: Icon(
                    obscurecerPass ? Icons.visibility : Icons.visibility_off
                      )
                    )
                  ),
                )
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                loginUsuario(context);
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