import 'package:flutter/material.dart';

class AgregarResenia extends StatefulWidget {
  const AgregarResenia({super.key});

  @override
  State<AgregarResenia> createState() {
    return _AgregarResenaState();
  }
}

class _AgregarResenaState extends State<AgregarResenia>{

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
          Text('Nombre de la película seleccionada',
          style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 209, 206, 0),
              )
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 120,
              height: 70,
              child: TextField(
                style: TextStyle(
                color: Colors.white
                ),
                decoration: InputDecoration(
                icon: Icon(Icons.star, color: const Color.fromARGB(255, 255, 255, 255)),
                labelText: 'Calif.', fillColor: Colors.white,
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
              height: 150,
              child: TextField(
                style: TextStyle(
                color: Colors.white
                ),
                maxLines: 10,
                minLines: 1,
                maxLength: 500,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                labelText: 'Reseña', fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                    ),
                  )
                )
              )
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){

            }, 
            style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                backgroundColor: Color.fromARGB(255, 143, 0, 55),
            ),
            child: Text('Agregar Reseña',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )
              )
            )
          ],
        )
      )
    );
  }
}