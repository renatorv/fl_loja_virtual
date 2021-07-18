import 'package:fl_loja_virtual/controller/user_controller.dart';
import 'package:fl_loja_virtual/view/home/home_page.dart';
import 'package:fl_loja_virtual/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import 'cadastro_page.dart';
import 'login_recuperar_page.dart';

class LoginPage extends StatelessWidget {
  static String tag = '/login-page';

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final Map<String, dynamic> _data = {};

  @override
  Widget build(BuildContext context) {
    var userController = Provider.of<UserController>(context);
    return Scaffold(
      body: Form(
        key: _form,
        child: Stack(
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
                  padding: EdgeInsets.only(
                      top: 100, left: 40, right: 40, bottom: 20),
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
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Informe seu e-mail';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _data['email'] = value;
                              },
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
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Informe a senha';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _data['senha'] = value;
                              },
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(LoginRecuperarPage.tag),
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
                                onPressed: () async {
                                  if (_form.currentState.validate()) {
                                    _form.currentState.save();

                                    String error = await userController
                                        .entrarPorEmailSenha(
                                      email: _data['email'],
                                      senha: _data['senha'],
                                    );

                                    if (error != null) {
                                      Toast.show(
                                        error,
                                        context,
                                        duration: Toast.LENGTH_LONG,
                                        gravity: Toast.BOTTOM,
                                      );
                                    } else {
                                      // Mata a navegação anterior e vai para a HomePage
                                      Navigator.of(context)
                                          .popUntil((route) => route.isFirst);
                                      Navigator.of(context)
                                          .pushReplacementNamed(HomePage.tag);
                                    }
                                  }
                                },
                                child: Text('Entrar'),
                                style: ElevatedButton.styleFrom(
                                  primary: Layout.primary(),
                                  onPrimary: Colors.white,
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
                            onPressed: () => Navigator.of(context)
                                .pushNamed(CadastroPage.tag),
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
      ),
      backgroundColor: Layout.secondary(),
    );
    // return Layout.render(
    //   context,
    //   Container(),
    // );
  }
}
