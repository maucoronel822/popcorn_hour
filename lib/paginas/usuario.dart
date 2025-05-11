import 'package:flutter/material.dart';

class PaginaUsuario extends StatefulWidget {
  const PaginaUsuario({super.key});

  @override
  State<PaginaUsuario> createState() {
    return _PaginaUsuarioState();
  }
}

class _PaginaUsuarioState extends State<PaginaUsuario> {

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                    width: 200,
                    height: 450,
                    color: Colors.grey.shade800,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/TLOU.jpg',
                        width: 200,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 200,
                    height: 450,
                    color: Colors.grey.shade800,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/breaking-bad.jpg',
                        width: 200,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 200,
                    height: 450,
                    color: Colors.grey.shade800,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/black-mirror.jpg',
                        width: 200,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                /*SizedBox(width: 2),
                Image.asset('assets/breaking-bad.jpg', width: 300, height: 350),
                SizedBox(width: 2),
                Image.asset('assets/black-mirror.jpg', width: 300, height: 350),
                SizedBox(width: 2),
                Image.asset('assets/mickey-17.jpg', width: 300, height: 350),*/
              ],
            ),
          ]
        )
      )
    );
  }
}