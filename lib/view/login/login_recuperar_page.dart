import 'package:fl_loja_virtual/controller/user_controller.dart';
import 'package:fl_loja_virtual/view/home/home_page.dart';
import 'package:fl_loja_virtual/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import 'cadastro_page.dart';
import 'login_page.dart';

class LoginRecuperarPage extends StatelessWidget {
  static String tag = '/login-recuperar-page';

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

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
                              controller: _emailController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Informe o e-mail';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(LoginPage.tag),
                                child: Text(
                                  'Fazer login',
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
                                    String error = await userController
                                        .recuperarSenhaPorEmail(
                                            _emailController.text);

                                    Toast.show(
                                      error != null
                                          ? error
                                          : 'Verifique sua nova senha em seu e-mail.',
                                      context,
                                      duration: Toast.LENGTH_LONG,
                                      gravity: Toast.BOTTOM,
                                    );
                                  }
                                },
                                child: Text('Recuperar senha'),
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
  }
}
