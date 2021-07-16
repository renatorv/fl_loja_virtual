import 'package:firebase_auth/firebase_auth.dart';

class UserController {
  final String teste = 'Um testo qq';

  User user;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
