import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // las sugerencias cuando la presona escribe

    final listaSugerida = (query.isEmpty)
        ? peliculasRecientes
        : peliculas.where(
            (peli) => peli.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
        itemCount: listaSugerida.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.movie),
            title: Text(listaSugerida[i]),
            onTap: () {},
          );
        });
  }
}
