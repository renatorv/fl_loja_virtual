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
      initialRoute: HomePage.tag,
      routes: {
        HomePage.tag: (context) => HomePage(),
      },
    );
  }
}
