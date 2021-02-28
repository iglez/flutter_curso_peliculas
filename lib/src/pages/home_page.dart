import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas'),
        backgroundColor: Colors.indigoAccent,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Container(
        child: Column(
          children: [
            _swiperTarjetas(),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {
    // https://pub.dev/packages/flutter_swiper
    return Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.network("http://via.placeholder.com/350x150",
            fit: BoxFit.fill);
        },
        itemCount: 3,
        pagination: SwiperPagination(),
        control: SwiperControl(),
      );
  }
}
