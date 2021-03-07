import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones de nuestro appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            print('click action');
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
          print('leading icon press');
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
    return Container();
  }
}
