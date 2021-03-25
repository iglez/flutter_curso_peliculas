import 'package:peliculas/src/models/actor_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apiKey = '99568c3e97fec3b5e291a3ab8ab92f64';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = List();

  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  // introducir peliculas
  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  // obtener datos
  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    // validar error code
    final decodedData = json.decode(resp.body);
    final peliculas = Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    // https://api.themoviedb.org/3/movie/now_playing?api_key=99568c3e97fec3b5e291a3ab8ab92f64&language=en-US&page=1
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});

    // https://pub.dev/packages/http

    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    if (_cargando) return [];

    _cargando = true;
    _popularesPage++;

    // print('cargando siguientes...');

    // https://api.themoviedb.org/3/movie/now_playing?api_key=99568c3e97fec3b5e291a3ab8ab92f64&language=en-US&page=1
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    // https://pub.dev/packages/http

    final respuesta = await _procesarRespuesta(url);

    _populares.addAll(respuesta);
    popularesSink(_populares);

    _cargando = false;
    return respuesta;
  }

  Future<List<Actor>> getCast(String peliculaID) async {
    // https://api.themoviedb.org/3/movie/587807/credits?api_key=99568c3e97fec3b5e291a3ab8ab92f64&language=en-US
    final url = Uri.https(_url, '3/movie/$peliculaID/credits', {
      'api_key': _apiKey,
      'language': _language,
      'movie': peliculaID,
    });

    final resp = await http.get(url);
    // validar error code
    final decodedData = json.decode(resp.body);
    final cast = Cast.fromJsonList(decodedData['cast']);

    return cast.actores;
  }
}
