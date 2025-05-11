// Libreria
import 'package:flutter/material.dart';
import './routes.dart';

// Función principal
void main() {

  // Esta funcion se encarga de crear nuestra aplicación
  // Existe en flutter pero no en Dart
  runApp(PopCornHour()); // Necesita una aplicación que compilar

}

class PopCornHour extends StatelessWidget {
  const PopCornHour({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Popcorn Hour',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color.fromARGB(255, 5, 5, 5),
      ),
      routes: getAppRoutes(),
      initialRoute: '/',
    );
  }
}
