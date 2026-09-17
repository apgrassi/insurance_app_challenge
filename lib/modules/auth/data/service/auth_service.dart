import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String cpfToEmail(String cpf) {
    final cleanCpf = cpf.replaceAll(RegExp(r'\D'), '');

    return '$cleanCpf@insurance.app';
  }

  Future<UserCredential> login({
    required String cpf,
    required String password,
  }) async {
    final email = cpfToEmail(cpf);

    return firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> register({
    required String name,
    required String cpf,
    required String password,
  }) async {
    final email = cpfToEmail(cpf);

    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCredential.user?.updateDisplayName(name);

    return userCredential;
  }
}
