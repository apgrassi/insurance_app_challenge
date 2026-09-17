import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:flutter/material.dart';
import 'package:insurance_app_challenge/core/theme/app_spacing.dart';
import 'package:insurance_app_challenge/modules/auth/data/service/auth_service.dart';
import 'package:insurance_app_challenge/modules/home/presentation/pages/home_pages.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:insurance_app_challenge/modules/auth/presentation/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();
  final formKey = GlobalKey<FormState>();

  final cpfController = TextEditingController();
  final passwordController = TextEditingController();

  final cpfMaskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

  bool rememberMe = false;
  bool obscurePassword = true;

  @override
  void dispose() {
    cpfController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 420,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Bem-vindo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    TextFormField(
                      controller: cpfController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [cpfMaskFormatter],
                      decoration: const InputDecoration(
                        labelText: 'CPF',
                        hintText: '000.000.000-00',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite seu CPF';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: AppSpacing.md),
                    TextFormField(
                      controller: passwordController,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        hintText: 'Digite sua senha',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite sua senha';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value ?? false;
                            });
                          },
                        ),
                        const Text('Lembrar sempre'),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Esqueceu a senha?'),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    FilledButton(
                      onPressed: () async {
                        final isValid =
                            formKey.currentState?.validate() ?? false;

                        if (!isValid) {
                          return;
                        }

                        try {
                          final userCredential = await authService.login(
                            cpf: cpfController.text,
                            password: passwordController.text,
                          );

                          if (!context.mounted) return;

                          context.read<AuthProvider>().setUser(
                                userCredential.user,
                              );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          debugPrint(e.code);
                        }
                      },
                      child: const Text('Entrar'),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    OutlinedButton(
                      onPressed: () async {
                        final isValid =
                            formKey.currentState?.validate() ?? false;

                        if (!isValid) {
                          return;
                        }

                        final nameController = TextEditingController();

                        final name = await showDialog<String>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Criar conta'),
                              content: TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  labelText: 'Nome',
                                  hintText: 'Digite seu nome',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancelar'),
                                ),
                                FilledButton(
                                  onPressed: () {
                                    final name = nameController.text.trim();

                                    if (name.isEmpty) {
                                      return;
                                    }

                                    Navigator.pop(context, name);
                                  },
                                  child: const Text('Cadastrar'),
                                ),
                              ],
                            );
                          },
                        );

                        if (name == null) {
                          nameController.dispose();
                          return;
                        }

                        try {
                          await authService.register(
                            name: name,
                            cpf: cpfController.text,
                            password: passwordController.text,
                          );
                        } on FirebaseAuthException catch (e) {
                          debugPrint(e.code);
                        } finally {
                          nameController.dispose();
                        }
                      },
                      child: const Text('Cadastrar'),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                          ),
                          child: Text('ou entre com'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          tooltip: 'Google',
                          icon: const Icon(Icons.g_mobiledata),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        IconButton(
                          onPressed: () {},
                          tooltip: 'Facebook',
                          icon: const Icon(Icons.facebook),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        IconButton(
                          onPressed: () {},
                          tooltip: 'Apple',
                          icon: const Icon(Icons.apple),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
