import 'package:flutter/material.dart';
import 'view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.tag,
      routes: {
        HomePage.tag: (context) => HomePage(),
      },
    );
  }
}
7 minutos
git remote add origin https://github.com/renatorv/fl_loja_virtual.git
git branch -M main
git push -u origin main