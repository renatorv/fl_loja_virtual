import 'package:fl_loja_virtual/view/layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    var content = Column();

    return Layout.render(context, content, bottomItemSelected: 0
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => null,
        //   child: Icon(Icons.plus_one),
        // ),
        );
  }
}
