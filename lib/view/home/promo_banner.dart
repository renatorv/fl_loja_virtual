import 'package:fl_loja_virtual/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PromoBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var swyper = Swiper(
      itemBuilder: (BuildContext context, int i) {
        return Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              'assets/images/promocoes/promo-${i + 1}.png',
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Layout.light(.8),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        );
      },
      itemCount: 3,
      autoplay: true,
      duration: 700,
      pagination: SwiperPagination(),
      scale: 0.9,
      viewportFraction: 0.85,
      // curve: Curves.easeInOutBack, //https://api.flutter.dev/flutter/animation/Curves-class.html
      layout: SwiperLayout.STACK,
      itemWidth: MediaQuery.of(context).size.width - 40,
      itemHeight: 200,
      //configurações: aula 10 em 50 minutos
    );

    return swyper;
    // return ListView(
    //   physics: PageScrollPhysics(),
    //   scrollDirection: Axis.horizontal,
    //   children: List.generate(3, (int i) {
    //     return Container(
    //       margin: EdgeInsets.only(
    //         left: 20,
    //         right: 20,
    //       ),
    //       width: MediaQuery.of(context).size.width - 40,
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.circular(25),
    //         child: Image.asset(
    //           'assets/images/promocoes/promo-${i + 1}.png',
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       foregroundDecoration: BoxDecoration(
    //         border: Border.all(
    //           width: 3,
    //           color: Layout.light(.8),
    //         ),
    //         borderRadius: BorderRadius.circular(25),
    //       ),
    //     );
    //   }),
    // );
  }
}
