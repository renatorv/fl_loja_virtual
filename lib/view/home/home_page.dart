import 'package:fl_loja_virtual/view/home/destaques.dart';
import 'package:fl_loja_virtual/view/home/promo_banner.dart';
import 'package:fl_loja_virtual/view/home/roda_categoria.dart';
import 'package:fl_loja_virtual/view/layout.dart';
import 'package:flutter/material.dart';

import '../layout.dart';

class HomePage extends StatelessWidget {
  static String tag = '/home-page';

  @override
  Widget build(BuildContext context) {
    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: PromoBanner(),
        ),
        SizedBox(height: 20),
        Expanded(
          flex: 2,
          child: Destaques(),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Categorias',
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: Layout.light(),
                  fontSize: 20,
                ),
          ),
        ),
        Container(
          height: 90,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: RodaCategoria(),
          ),
        ),
      ],
    );

    return Layout.render(
      context,
      content,
      bottomItemSelected: 0,
    );
  }
}
