import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maphi_contas/auth/data/services/google_sign_in_service_adapter.dart';
import 'package:maphi_contas/core/data/config/dependency_injection.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_implementation_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SignInService>(), MockSpec<GoogleSignInAccount>()])
void main() {
  test('Quando um evento do GoogleSignIn acontecer e for um signin deve tratar e retornar um GoogleAuthState', () {
    final signInService = MockSignInService();
    final anyAccount = MockGoogleSignInAccount();

    when(signInService.watchAuthenticationEventsStream()).thenAnswer(
      (_) =>
          Stream.value(GoogleSignInAuthenticationEventSignIn(user: anyAccount)),
    );

    final container = ProviderContainer(
      overrides: [signInServiceProvider.overrideWith(((ref) => signInService))],
    );
  });
}
