import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  // const CardSwiper({Key key}) : super(key: key);

  final List<dynamic> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: _screenSize.height * 0.5,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network("http://via.placeholder.com/350x150",
              fit: BoxFit.fill);
        },
        itemCount: 3,
        pagination: SwiperPagination(),
        control: SwiperControl(),
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
