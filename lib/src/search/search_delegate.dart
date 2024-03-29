import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  String seleccion;
  final peliculasProvider = PeliculasProvider();

  final peliculas = [
    'Pelicula 1',
    'Pelicula 2',
    'Pelicula 3',
    'Pelicula 4',
    'Pelicula 5',
  ];
  final peliculasRecientes = [
    'Pelicula 3',
    'Pelicula 5',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones de nuestro appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados a mostrar
    return Center(
        child: Container(
      height: 100.0,
      width: 100,
      color: Colors.blueAccent,
      child: Text(seleccion),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // las sugerencias cuando la presona escribe

    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final peliculas = snapshot.data;

        return ListView(
          children: peliculas.map((peli) {
            return ListTile(
              leading: FadeInImage(
                image: NetworkImage(peli.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                width: 50.0,
                fit: BoxFit.contain,
              ),
              title: Text(peli.title),
              subtitle: Text(peli.originalTitle),
              onTap: () {
                close(context, null);
                peli.uniqueId = '';
                Navigator.pushNamed(context, 'detalle', arguments: peli);
              },
            );
          }).toList(),
        );
      },
    );
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // las sugerencias cuando la presona escribe

  //   final listaSugerida = (query.isEmpty)
  //       ? peliculasRecientes
  //       : peliculas
  //           .where((peli) => peli.toLowerCase().startsWith(query.toLowerCase()))
  //           .toList();

  //   return ListView.builder(
  //       itemCount: listaSugerida.length,
  //       itemBuilder: (context, i) {
  //         return ListTile(
  //           leading: Icon(Icons.movie),
  //           title: Text(listaSugerida[i]),
  //           onTap: () {
  //             seleccion = listaSugerida[i];
  //             showResults(context);
  //           },
  //         );
  //       });
  // }
}
