import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout {
  static Widget render(BuildContext context, Widget child, {String title, Widget floatingActionButton, int bottomItemSelected}) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Expanded(child: child),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
      backgroundColor: Layout.secondary(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny, size: 30),
            label: 'Ínicio',
            // title: Text('Ínicio'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit, size: 30),
            // title: Text('Compras'),
            label: 'Compas',
          ),
        ],
      ),
    );
  }

  static Color primary([double opacity = 1]) => Color(0xff195738).withOpacity(opacity);
  static Color primaryLight([double opacity = 1]) => Color(0xff007d40).withOpacity(opacity);
  static Color primaryDark([double opacity = 1]) => Color(0xff123D27).withOpacity(opacity);

  static Color secondary([double opacity = 1]) => Color(0xffddc199).withOpacity(opacity);
  static Color secondaryLight([double opacity = 1]) => Color(0xffE0CF9D).withOpacity(opacity);
  static Color secondaryDark([double opacity = 1]) => Color(0xffce9150).withOpacity(opacity);
  static Color secondaryHight([double opacity = 1]) => Color(0xffFDAC25).withOpacity(opacity);

  static Color light([double opacity = 1]) => Color(0xfff0ece1).withOpacity(opacity);
  static Color dark([double opacity = 1]) => Color(0xff000000).withOpacity(opacity);
}


// Color(0xffE0CF9D);
// Color(0xffF1F0EC);
// Color(0xffCAAF74);
// Color(0xffB88A52);
// Color(0xff2C3527);
// Color(0xff9C6D3E);
// Color(0xffFDAC25);