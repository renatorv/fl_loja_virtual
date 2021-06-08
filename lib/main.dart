import 'package:fl_loja_virtual/login/cadastro_page.dart';
import 'package:fl_loja_virtual/login/login_page.dart';
import 'package:fl_loja_virtual/login/login_recuperar_page.dart';
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
      },
    );
  }
}
