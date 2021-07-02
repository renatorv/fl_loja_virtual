import 'package:flutter/material.dart';

import '../layout.dart';

class CategoriaPage extends StatelessWidget {
  static String tag = '/categoria-page';

  final int id;

  CategoriaPage(this.id);

  @override
  Widget build(BuildContext context) {
    print(Layout.categoriaPorId(id));

    return Text('Um conteúdo - #$id');
  }
}
