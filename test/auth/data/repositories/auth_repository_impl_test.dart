import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/dataform/v1.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maphi_contas/auth/data/services/sign_in_service.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/core/data/config/dependency_injection.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SignInService>(),
  MockSpec<GoogleSignInAccount>(),
  MockSpec<GoogleSignInClientAuthorization>(),
])
void main() {
  test('Quando inicializar a Stream e tudo ocorrer bem, deve tentar autenticar e retornar uma stream vazia', () async {
    final signInService = MockSignInService();
    // final anyAccount = MockGoogleSignInAccount();

    when(signInService.attemptLogin())
        .thenAnswer((answer) => Future.value(null));

    final container = ProviderContainer(
      overrides: [signInServiceProvider.overrideWith(((ref) => signInService))],
    );

    final repository = container.read(authRepositoryProvider);

    expectLater(
      repository.initializeService(),
      neverEmits(Either<AppFailure, GoogleAuthState>),
    );
  });

  test(
    'Quando inicializar a Stream e algo der errado, deve emitir um Failure',
    () async {
      final signInService = MockSignInService();
      // final anyAccount = MockGoogleSignInAccount();

      when(signInService.attemptLogin())
          .thenAnswer((answer) => throw Exception("Erro qualquer"));

      final container = ProviderContainer(
        overrides: [
          signInServiceProvider.overrideWith(((ref) => signInService)),
        ],
      );

      final repository = container.read(authRepositoryProvider);

      expectLater(
        repository.initializeService(),
        emits(
          Either<AppFailure, GoogleAuthState>.left(
            AppFailure(statusCode: "500", message: "Exception: Erro qualquer"),
          ),
        ),
      );
    },
  );

  test('Quando inicializar a Stream e houver uma conta utilizada anteriormente e o attemptLogin funcionar, deve emitir um GoogleAuthState com a conta', () async {
    final signInService = MockSignInService();
    final anyAccount = MockGoogleSignInAccount();
    final anyClientAuthorization = MockGoogleSignInClientAuthorization();

    when(signInService.attemptLogin())
        .thenAnswer((answer) => Future.value(anyAccount));

    when(signInService.watchAuthenticationEventsStream()).thenAnswer(
      (answer) =>
          Stream.value(GoogleSignInAuthenticationEventSignIn(user: anyAccount)),
    );

    when(signInService.authorizationForScopes(user: anyAccount))
        .thenAnswer((answer) => Future.value(anyClientAuthorization));

    final container = ProviderContainer(
      overrides: [signInServiceProvider.overrideWith(((ref) => signInService))],
    );

    final repository = container.read(authRepositoryProvider);

    expectLater(
      repository.initializeService(),
      emits(
        Either<AppFailure, GoogleAuthState>.of(
          GoogleAuthState(currentUser: anyAccount, isAuthorized: true),
        ),
      ),
    );
  });
  test(
    'Quando for solicitado um authorizeScopes, deve emitir um bool de sucesso',
    () async {
      final signInService = MockSignInService();
      final anyAccount = MockGoogleSignInAccount();
      final anyClientAuthorization = MockGoogleSignInClientAuthorization();

      when(signInService.authorizeScopes(user: anyAccount))
          .thenAnswer((answer) => Future.value(anyClientAuthorization));

      final container = ProviderContainer(
        overrides: [
          signInServiceProvider.overrideWith(((ref) => signInService)),
        ],
      );

      final repository = container.read(authRepositoryProvider);

      // expectLater(
      //   // repository.authorizeScopes(),
      //   emits(
      //     Either<AppFailure, bool>.of(true)
      //   ),
      // );
    },
  );
}
