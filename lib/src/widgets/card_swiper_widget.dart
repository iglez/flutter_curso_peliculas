import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  // const CardSwiper({Key key}) : super(key: key);

  final List<dynamic> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: 300.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.network("http://via.placeholder.com/350x150",
            fit: BoxFit.fill);
        },
        itemCount: 3,
        pagination: SwiperPagination(),
        control: SwiperControl(),
        itemWidth: 200.0,
        itemHeight: 200.0,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
