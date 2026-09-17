import 'package:flutter/material.dart';
import 'package:insurance_app_challenge/core/theme/app_theme.dart';
import 'package:insurance_app_challenge/modules/auth/presentation/pages/login_page.dart';
import 'package:insurance_app_challenge/modules/auth/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class InsuranceApp extends StatelessWidget {
  const InsuranceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        title: 'Insurance App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: LoginPage(),
      ),
    );
  }
}
