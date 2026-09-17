import 'package:flutter/material.dart';

import 'package:insurance_app_challenge/core/theme/app_spacing.dart';
import 'package:insurance_app_challenge/modules/auth/presentation/providers/auth_provider.dart';
import 'package:insurance_app_challenge/modules/home/presentation/pages/webview_page.dart';
import 'package:insurance_app_challenge/modules/home/presentation/widgets/home_drawer.dart';
import 'package:insurance_app_challenge/modules/home/presentation/widgets/insurance_option.dart';
import 'package:insurance_app_challenge/modules/home/presentation/widgets/welcome_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = context.watch<AuthProvider>().userName;
    return Scaffold(
      drawer: HomeDrawer(userName: userName),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'INSURANCE',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'SEGURADORA',
              style: TextStyle(
                fontSize: 9,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Badge(
              child: Icon(Icons.notifications_none),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeCard(
                    userName: userName,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const Text(
                    'Cotar e Contratar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Row(
                    children: [
                      Expanded(
                        child: InsuranceOption(
                          title: 'Automóvel',
                          icon: Icons.directions_car_outlined,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WebViewPage(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: InsuranceOption(
                          title: 'Residência',
                          icon: Icons.home_outlined,
                        ),
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: InsuranceOption(
                          title: 'Vida',
                          icon: Icons.favorite_border,
                        ),
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: InsuranceOption(
                          title: 'Acidentes\nPessoais',
                          icon: Icons.personal_injury_outlined,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const Text(
                    'Minha Família',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.xl,
                      horizontal: AppSpacing.md,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSpacing.md),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: AppSpacing.xxl,
                        ),
                        SizedBox(height: AppSpacing.md),
                        Text(
                          'Adicione aqui membros da sua família e\n'
                          'compartilhe os seguros com eles.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const Text(
                    'Contratados',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.xl,
                      horizontal: AppSpacing.md,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSpacing.md),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.sentiment_dissatisfied_outlined,
                          size: AppSpacing.xxl,
                        ),
                        SizedBox(height: AppSpacing.md),
                        Text(
                          'Você ainda não possui seguros contratados.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
