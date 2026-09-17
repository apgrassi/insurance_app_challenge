import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  String get userName => _user?.displayName ?? 'Usuário';

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }
}
