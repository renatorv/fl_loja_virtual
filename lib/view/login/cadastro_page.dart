import 'package:fl_loja_virtual/controller/user_controller.dart';
import 'package:fl_loja_virtual/view/home/home_page.dart';
import 'package:fl_loja_virtual/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import 'login_page.dart';

class User {
  String nome;
  String email;
  String senha;

  @override
  String toString() {
    return '$nome => $email => $senha';
  }
}

class CadastroPage extends StatelessWidget {
  static String tag = '/cadastro-page';

  final GlobalKey<ScaffoldState> _scafold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _senha = TextEditingController();

  final Map<String, dynamic> data = {};

  User user = User();

  @override
  Widget build(BuildContext context) {
    var userController = Provider.of<UserController>(context);

    return Scaffold(
      key: _scafold,
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
                                hintText: 'Nome',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Layout.primary(),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo obrigatório';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                // data['nome'] = value;
                                user.nome = value;
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'E-mail',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Layout.primary(),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo obrigatório';
                                } else if (!value.contains('@')) {
                                  return 'Preencha o campo com um e-mail válido!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                // data['email'] = value;
                                user.email = value;
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              obscureText: true,
                              controller: _senha,
                              decoration: InputDecoration(
                                hintText: 'Senha',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Layout.primary(),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo obrigatório';
                                } else if (value.length < 6) {
                                  return 'Pelo menos 6 caracteres';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                // data['senha'] = value;
                                user.senha = value;
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Confirmar senha',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Layout.primary(),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo obrigatório';
                                } else if (value != _senha.text) {
                                  return 'Senhas não conferem';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 42,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_form.currentState.validate()) {
                                    _form.currentState.save();
                                  }

                                  String error = await userController
                                      .criarContaPorEmailSenha(
                                    user.nome,
                                    user.email,
                                    user.senha,
                                  );

                                  if (error != null) {
                                    Toast.show(
                                      error,
                                      context,
                                      duration: Toast.LENGTH_LONG,
                                      gravity: Toast.BOTTOM,
                                    );
                                    return;
                                  }
                                  //
                                  // Se até aqui não deu nenhum erro
                                  // é pq deu tudo certo e o login já está salvo no UserController
                                  // Redireciona para a página inicial
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                  Navigator.of(context)
                                      .pushReplacementNamed(HomePage.tag);
                                },
                                child: Text('Criar conta'),
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
                            onPressed: () =>
                                Navigator.of(context).pushNamed(LoginPage.tag),
                            child: Text(
                              'Fazer login',
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

  // criarConta(BuildContext context) async {
  //   if (_form.currentState.validate()) {
  //     _form.currentState.save();

  //     // Toast.show(
  //     //   msg,
  //     //   context,
  //     //   duration: Toast.LENGTH_LONG,
  //     //   gravity: Toast.BOTTOM,
  //     // );

  //     // try {
  //     //   // Criamos o usuário no Firebase
  //     //   var auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     //     email: user.email,
  //     //     password: user.senha,
  //     //   );

  //     //   // Adicionamos a ele o nome de exibição
  //     //   await auth.user.updateDisplayName(user.nome);

  //     //   await auth.user.sendEmailVerification();

  //     //   // Navega para a próxima
  //     //   //Navigator.of(context).pushNamed(HomePage.tag);
  //     // } catch (e) {
  //     //   if (e.code != null) {
  //     //     String msg = 'Erro desconhecido, tente novamente.';
  //     //     switch (e.code) {
  //     //       case 'invalid-email':
  //     //         msg = 'E-mail inválido.';
  //     //         break;
  //     //       case 'email-already-in-use':
  //     //         msg = 'E-mail já cadastrado.';
  //     //         break;
  //     //     }
  //     //     Toast.show(
  //     //       msg,
  //     //       context,
  //     //       duration: Toast.LENGTH_LONG,
  //     //       gravity: Toast.BOTTOM,
  //     //     );
  //     //   }
  //     // }
  //   }
  // }
}
