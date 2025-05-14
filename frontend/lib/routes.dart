// Este archivo me ayudará a controlar las rutas de mi aplicación
import 'package:flutter/material.dart';
import './paginas/login.dart';
import './paginas/principal.dart';
import './paginas/signup.dart';
import './paginas/usuario.dart';
import './paginas/agregar_pelicula.dart';
import './paginas/agregar_resenia.dart';
import './paginas/pelicula.dart';


/* En flutter para poder tener rutas, necesitamos hacer uso de diccionarios
En python un diccionario funciona con llaves:valores
Mapas -> Map<tipo_llave, tipo_valor>
*/

Map<String, WidgetBuilder> misRutas = {
//  llave : valor
  '/login'            : (BuildContext context) => LoginPage(), // Al momento en el que el usuario ingresa a mi ruta 'login' se construye 
  '/signup'           : (BuildContext context) => SignupPage(),
  '/'                 : (BuildContext context) => Principal(),
  '/user'             : (BuildContext context) => PaginaUsuario(),
  '/agregar_pelicula' : (BuildContext context) => AgregarPelicula(),
  '/agregar_resenia'  : (BuildContext context) => AgregarResenia(),
  '/pelicula'         : (BuildContext context) => Pelicula(),
};

Map<String, WidgetBuilder> getAppRoutes() {
  return misRutas;
}