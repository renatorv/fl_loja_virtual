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

  Future<String> entrarPorEmailSenha({String email, String senha}) async {
    String msg;

    try {
      var auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

      setUser(auth.user);
    } catch (e) {
      msg = 'Erro desconhecido, tente novamente';
      if (e.code != null) {
        switch (e.code) {
          case 'invalid-email':
            msg = 'Email ou senha inválido.';
            break;

          case 'user-disabled':
            msg = 'Usuário não habilitado a acessar o sistema.';
            break;

          case 'user-not-found':
            msg = 'Usuário não encontrado.';
            break;

          case 'wrong-password':
            msg = 'Email ou senha inválido.';
            break;
        }
      }
    }

    return msg;
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

  Future<String> recuperarSenhaPorEmail(String email) async {
    String msg;

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      msg = 'Erro desconhecido, tente novamente';

      if (e.code != null) {
        switch (e.code) {
          case 'invalid-email':
            msg = 'Informe um e-mail válido.';
            break;

          case 'user-not-found':
            msg = 'Usuário não encontrado.';
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
