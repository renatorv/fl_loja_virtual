import 'package:fl_loja_virtual/controller/user_controller.dart';
import 'package:fl_loja_virtual/view/home/home_page.dart';
import 'package:fl_loja_virtual/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class SplashPage extends StatelessWidget {
  static String tag = '/splash-page';

  @override
  Widget build(BuildContext context) {
    //Recupera a instância do controller
    var userController = Provider.of<UserController>(context);

    userController.checkLoggetIn().then(
      (UserAuthStatus status) {
        Future.delayed(Duration(milliseconds: 2000), () {
          // Mata todas as rotas anteriores
          Navigator.of(context).popUntil((route) => route.isFirst);
          //
          if (status == UserAuthStatus.loggedIn) {
            //
            Navigator.of(context).popAndPushNamed(HomePage.tag);
          } else {
            Navigator.of(context).popAndPushNamed(LoginPage.tag);
          }
        });
      },
    );

    return Scaffold(
      backgroundColor: Layout.secondary(),
      body: Stack(
        children: [
          //
          //Imagem de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fl-img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
