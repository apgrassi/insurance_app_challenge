import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app_challenge/app.dart';
import 'package:insurance_app_challenge/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const InsuranceApp());
}
