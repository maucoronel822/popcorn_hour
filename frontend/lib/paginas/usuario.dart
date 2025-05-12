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
       body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido a Popcorn Hour',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 209, 206, 0)
                )
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 370,
                  color: Colors.grey.shade800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Imagen de la película
                      Image.asset(
                        'assets/TLOU.jpg',
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),

                      // Calificación con estrella
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            SizedBox(width: 5),
                            Text(
                              '8.7',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      // Nombre de la película
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'The Last of Us',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // Botón para ver comentarios
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Aquí navegas a la página de comentarios
                            Navigator.pushNamed(context, '/resenias');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 143, 0, 55),
                          ),
                          child: Text('Ver reseñas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 200,
                  height: 370,
                  color: Colors.grey.shade800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Imagen de la película
                      Image.asset(
                        'assets/avatar.jpg',
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),

                      // Calificación con estrella
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            SizedBox(width: 5),
                            Text(
                              '8.7',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      // Nombre de la película
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Avatar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // Botón para ver comentarios
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Aquí navegas a la página de comentarios
                            Navigator.pushNamed(context, '/resenias');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 143, 0, 55),
                          ),
                          child: Text('Ver reseñas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 200,
                  height: 370,
                  color: Colors.grey.shade800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Imagen de la película
                      Image.asset(
                        'assets/black-mirror.jpg',
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),

                      // Calificación con estrella
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            SizedBox(width: 5),
                            Text(
                              '8.7',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      // Nombre de la película
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Black Mirror',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // Botón para ver comentarios
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Aquí navegas a la página de comentarios
                            Navigator.pushNamed(context, '/resenias');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 143, 0, 55),
                          ),
                          child: Text('Ver reseñas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 200,
                  height: 370,
                  color: Colors.grey.shade800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Imagen de la película
                      Image.asset(
                        'assets/breaking-bad.jpg',
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),

                      // Calificación con estrella
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            SizedBox(width: 5),
                            Text(
                              '8.7',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      // Nombre de la película
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Breaking Bad',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // Botón para ver comentarios
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Aquí navegas a la página de comentarios
                            Navigator.pushNamed(context, '/resenias');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 143, 0, 55),
                          ),
                          child: Text('Ver reseñas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 200,
                  height: 370,
                  color: Colors.grey.shade800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Imagen de la película
                      Image.asset(
                        'assets/mickey-17.jpg',
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),

                      // Calificación con estrella
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            SizedBox(width: 5),
                            Text(
                              '8.7',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      // Nombre de la película
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Mickey 17',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // Botón para ver comentarios
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Aquí navegas a la página de comentarios
                            Navigator.pushNamed(context, '/resenias');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 143, 0, 55),
                          ),
                          child: Text('Ver reseñas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextButton(onPressed: () {
              // Aquí navegas a la página de ver todas las películas
              Navigator.pushNamed(context, '/verTodasLasPeliculas');
              }, 
              child: Text(
                'Ver todas las películas', 
                style: TextStyle(
                  color: Color.fromARGB(255, 209, 206, 0), 
                  fontSize: 20),
                  )
                ),
              SizedBox(height: 20),
              Text('¿Quieres agregar una película?', style: TextStyle(color: Colors.white, fontSize: 20),),
            SizedBox(height: 10),
            // Botón para agregar película
            ElevatedButton(
              onPressed: () {
                // Aquí navegas a la página de agregar película
                Navigator.pushNamed(context, '/agregarPelicula');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                backgroundColor: Color.fromARGB(255, 143, 0, 55),
              ),
              child: Text('Agregar pelicula', style: TextStyle(color: Colors.white),),
            ),
          ]
        )
      ),
    );
  }
}