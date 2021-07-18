import 'package:firebase_core/firebase_core.dart';
import 'package:fl_loja_virtual/controller/user_controller.dart';
import 'package:fl_loja_virtual/view/carrinho/carrinho_page.dart';
import 'package:fl_loja_virtual/view/compras/compras-page.dart';
import 'package:fl_loja_virtual/view/favoritos/favoritos_page.dart';
import 'package:fl_loja_virtual/view/login/cadastro_page.dart';
import 'package:fl_loja_virtual/view/login/login_page.dart';
import 'package:fl_loja_virtual/view/login/login_recuperar_page.dart';
import 'package:fl_loja_virtual/view/login/splash_page.dart';
import 'package:fl_loja_virtual/view/perfil/perfil_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/home/home_page.dart';
import 'view/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserController>(create: (_) => UserController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'JosefinSans',
          primarySwatch: Colors.blue,
          accentColor: Layout.light(),
          textTheme: TextTheme(
            headline6: TextStyle(
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
        initialRoute: SplashPage.tag,
        routes: {
          SplashPage.tag: (context) => SplashPage(),
          LoginPage.tag: (context) => LoginPage(),
          LoginRecuperarPage.tag: (context) => LoginRecuperarPage(),
          CadastroPage.tag: (context) => CadastroPage(),
          HomePage.tag: (context) => HomePage(),
          FavoritosPage.tag: (context) => FavoritosPage(),
          PerfilPage.tag: (context) => PerfilPage(),
          CarrinhoPage.tag: (context) => CarrinhoPage(),
          ComprasPage.tag: (context) => ComprasPage(),
        },
      ),
    );
  }
}
