import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  final String userName;
  const HomeDrawer({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person_outline),
              ),
              title: Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text('Home / Seguros'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.description_outlined),
                    title: const Text('Minhas Contratações'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.warning_amber_outlined),
                    title: const Text('Meus Sinistros'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.family_restroom),
                    title: const Text('Minha Família'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.inventory_2_outlined),
                    title: const Text('Meus Bens'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.payments_outlined),
                    title: const Text('Pagamentos'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.health_and_safety_outlined),
                    title: const Text('Coberturas'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.qr_code_scanner),
                    title: const Text('Validar Boleto'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone_outlined),
                    title: const Text('Telefones Importantes'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings_outlined),
                    title: const Text('Configurações'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
