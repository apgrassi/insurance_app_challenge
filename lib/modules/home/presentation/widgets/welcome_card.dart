import 'package:flutter/material.dart';
import 'package:insurance_app_challenge/core/theme/app_spacing.dart';

class WelcomeCard extends StatelessWidget {
  final String userName;

  const WelcomeCard({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            child: Icon(Icons.person_outline),
          ),
          const SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Bem-vindo(a),'),
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
