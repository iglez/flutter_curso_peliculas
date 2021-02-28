import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  // const MovieHorizontal({Key key}) : super(key: key);

  final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _sceenSize = MediaQuery.of(context).size;

    return Container(
      height: _sceenSize.height * 0.3,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        children: _tarjetas(),
      ),
    );
  }

  List<Widget> _tarjetas() {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 5.0),
        child: Column(
          children: [
            FadeInImage(
              placeholder: AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage(pelicula.getPosterImg()),
              fit: BoxFit.cover,
              height: 160.0,
            )
          ]
        ),
      );
    }).toList();
  }
}
