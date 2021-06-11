import 'package:fl_loja_virtual/login/cadastro_page.dart';
import 'package:fl_loja_virtual/login/login_page.dart';
import 'package:fl_loja_virtual/login/login_recuperar_page.dart';
import 'package:fl_loja_virtual/view/carrinho/carrinho_page.dart';
import 'package:fl_loja_virtual/view/compras/compras-page.dart';
import 'package:fl_loja_virtual/view/compras/compras_detalhe_page.dart';
import 'package:fl_loja_virtual/view/favoritos/favoritos_page.dart';
import 'package:fl_loja_virtual/view/perfil/perfil_page.dart';
import 'package:flutter/material.dart';
import 'view/home/home_page.dart';
import 'view/layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'JosefinSans',
        primarySwatch: Colors.blue,
        accentColor: Layout.light(),
        textTheme: TextTheme(
          title: TextStyle(
            shadows: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 2,
                color: Layout.dark(.3),
                offset: Offset(1, 2),
              )
            ],
          ),
        ),
      ),
      initialRoute: LoginPage.tag,
      routes: {
        LoginPage.tag: (context) => LoginPage(),
        LoginRecuperarPage.tag: (context) => LoginRecuperarPage(),
        CadastroPage.tag: (context) => CadastroPage(),
        HomePage.tag: (context) => HomePage(),
        FavoritosPage.tag: (context) => FavoritosPage(),
        PerfilPage.tag: (context) => PerfilPage(),
        CarrinhoPage.tag: (context) => CarrinhoPage(),
        ComprasPage.tag: (context) => ComprasPage(),
      },
    );
  }
}
