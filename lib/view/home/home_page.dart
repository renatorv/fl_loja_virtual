import 'package:fl_loja_virtual/view/home/roda_categoria.dart';
import 'package:fl_loja_virtual/view/layout.dart';
import 'package:flutter/material.dart';

import '../layout.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Layout.light(.7),
            borderRadius: BorderRadius.circular(25),
          ),
          margin: EdgeInsets.only(left: 20, right: 20),
          padding: EdgeInsets.all(18),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Text('Promoções'),
        ),
        SizedBox(height: 20),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Layout.light(.7),
              borderRadius: BorderRadius.circular(25),
            ),
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(18),
            width: MediaQuery.of(context).size.width,
            child: Text('Produtos'),
          ),
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
          height: 250,
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
