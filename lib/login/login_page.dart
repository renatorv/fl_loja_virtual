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
                padding:
                    EdgeInsets.only(top: 100, left: 40, right: 40, bottom: 20),
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
                              onPressed: () {},
                              child: Text(
                                'Esqueci minha senha',
                                style: TextStyle(
                                  color: Layout.secondaryDark(),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Entrar'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Não tem uma conta? Cadastre-se'),
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
