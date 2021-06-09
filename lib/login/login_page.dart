import 'package:fl_loja_virtual/login/cadastro_page.dart';
import 'package:fl_loja_virtual/login/login_recuperar_page.dart';
import 'package:fl_loja_virtual/view/home/home_page.dart';
import 'package:fl_loja_virtual/view/layout.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static String tag = '/login-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100, left: 40, right: 40, bottom: 20),
                child: Image.asset('assets/images/logo-sem-fundo.png'),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Layout.light(),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            spreadRadius: 2,
                            color: Layout.dark(.4),
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'E-mail',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Layout.primary(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Senha',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Layout.primary(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => Navigator.of(context).pushNamed(LoginRecuperarPage.tag),
                              child: Text(
                                'Esqueci minha senha',
                                style: TextStyle(
                                  color: Layout.secondaryDark(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 42,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).popAndPushNamed(HomePage.tag),
                              child: Text('Entrar'),
                              style: ElevatedButton.styleFrom(
                                primary: Layout.primary(),
                                onPrimary: Colors.white,
                                // shape: const BeveledRectangleBorder(
                                //   borderRadius: BorderRadius.all(
                                //     Radius.circular(6),
                                //   ),
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, right: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pushNamed(CadastroPage.tag),
                          //onPressed: () => Navigator.of(context).pushNamed(PerfilPage.tag),
                          child: Text(
                            'Não tem uma conta? Cadastre-se',
                            style: TextStyle(
                              color: Layout.dark(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Layout.secondary(),
    );
    // return Layout.render(
    //   context,
    //   Container(),
    // );
  }
}
