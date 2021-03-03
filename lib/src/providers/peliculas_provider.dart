import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apiKey = '99568c3e97fec3b5e291a3ab8ab92f64';
  String _url = 'api.themoviedb.org/';
  String _language = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    // https://api.themoviedb.org/3/movie/now_playing?api_key=99568c3e97fec3b5e291a3ab8ab92f64&language=en-US&page=1

  }

}
