import 'package:firebase_auth/firebase_auth.dart';

enum UserAuthStatus { waiting, loggedIn, loggedOut }

class UserController {
  User user;
  UserAuthStatus status = UserAuthStatus.waiting;

  Future<UserAuthStatus> checkLoggetIn() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    await setUser(firebaseUser);

    return status;
  }

  Future setUser(User firebaseUser) async {
    user = firebaseUser;

    status = UserAuthStatus.loggedOut;

    if (user != null) {
      status = UserAuthStatus.loggedIn;
    }
  }

  Future<String> criarContaPorEmailSenha(
      String nome, String email, String senha) async {
    String msg;
    try {
      // Criamos o usuário no Firebase
      var auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      // Adicionamos a ele o nome de exibição
      await auth.user.updateDisplayName(nome);

      // Envia email para o usuário confirmar
      await auth.user.sendEmailVerification();

      // Atribui ao objeto os dados de login dele
      // user = auth.user;
      setUser(auth.user);
      //
    } catch (e) {
      msg = 'Erro desconhecido, tente novamente.';
      if (e.code != null) {
        switch (e.code) {
          case 'invalid-email':
            msg = 'E-mail inválido.';
            break;
          case 'email-already-in-use':
            msg = 'E-mail já cadastrado.';
            break;
        }
      }
    }
    return msg;
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
