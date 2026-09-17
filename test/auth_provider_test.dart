import 'package:flutter_test/flutter_test.dart';
import 'package:insurance_app_challenge/modules/auth/presentation/providers/auth_provider.dart';

void main() {
  test('deve iniciar sem usuário autenticado', () {
    final authProvider = AuthProvider();

    expect(authProvider.user, isNull);
    expect(authProvider.userName, 'Usuário');
  });
}
