import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maphi_contas/auth/data/repositories/auth_repository_impl.dart';
import 'package:maphi_contas/auth/data/services/sign_in_service.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/auth/domain/failures/auth_failure.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SignInService>(),
  MockSpec<GoogleSignInAccount>(),
  MockSpec<GoogleSignInClientAuthorization>(),
  MockSpec<GoogleAuthState>(),
])
void main() {
  final anySignInService = MockSignInService();
  final anyAccount = MockGoogleSignInAccount();
  final anyClientAuthorization = MockGoogleSignInClientAuthorization();
  test('initializeService: Quando inicializar a Stream e tudo ocorrer bem, deve tentar autenticar e retornar uma stream vazia', () async {
    when(anySignInService.attemptLogin())
        .thenAnswer((answer) => Future.value(null));

    final repository = GoogleAuthRepositoryImpl(
      signInService: anySignInService,
    );

    expectLater(
      repository.initializeService(),
      neverEmits(Either<AppFailure, GoogleAuthState>),
    );
  });

  test('initializeService: Quando inicializar a Stream e algo der errado, deve emitir um InitializeServiceFailure', () async {
    when(anySignInService.attemptLogin())
        .thenAnswer((answer) => throw Exception("Erro qualquer"));

    final repository = GoogleAuthRepositoryImpl(
      signInService: anySignInService,
    );

    expectLater(
      repository.initializeService(),
      emits(
        Left(
          InitializeServiceFailure(statusCode: "500", message: "Erro qualquer"),
        ),
      ),
    );
  });

  test('initializeService: Quando inicializar a Stream e houver uma conta utilizada anteriormente e o attemptLogin funcionar, deve emitir um GoogleAuthState com a conta', () async {
    when(anySignInService.attemptLogin())
        .thenAnswer((answer) => Future.value(anyAccount));

    when(anySignInService.watchAuthenticationEventsStream()).thenAnswer(
      (answer) =>
          Stream.value(GoogleSignInAuthenticationEventSignIn(user: anyAccount)),
    );

    when(anySignInService.authorizationForScopes(user: anyAccount))
        .thenAnswer((answer) => Future.value(anyClientAuthorization));

    final repository = GoogleAuthRepositoryImpl(
      signInService: anySignInService,
    );

    expectLater(
      repository.initializeService(),
      emits(
        Right(GoogleAuthState(currentUser: anyAccount, isAuthorized: true)),
      ),
    );
  });
  test('requestAuthorization: Quando for solicitado um requestAuthorization, deve emitir um GoogleAuthState com o novo authorization', () async {
    when(anySignInService.requestAuthorization(user: anyAccount))
        .thenAnswer((answer) => Future.value(anyClientAuthorization));

    final repository = GoogleAuthRepositoryImpl(
      signInService: anySignInService,
    );

    expect(
      await repository.requestAuthorization(
        authState: GoogleAuthState(
          currentUser: anyAccount,
          isAuthorized: false,
        ),
      ),
      Right(GoogleAuthState(currentUser: anyAccount, isAuthorized: true)),
    );
  });

  test('requestAuthorization: Quando for solicitado um requestAuthorization e algo der errado, deve emitir um RequestAuthorizationFailure', () async {
    when(anySignInService.requestAuthorization(user: anyAccount))
        .thenThrow(Exception('Erro qualquer'));

    final repository = GoogleAuthRepositoryImpl(
      signInService: anySignInService,
    );

    expect(
      await repository.requestAuthorization(
        authState: GoogleAuthState(
          currentUser: anyAccount,
          isAuthorized: false,
        ),
      ),
      Left(
        RequestAuthorizationFailure(
          message: "Erro qualquer",
          statusCode: "500",
        ),
      ),
    );
  });

  test(
    "signOut: Quando for solicitado um signOut, não deve emitir nada",
    () async {
      when(anySignInService.signOut())
          .thenAnswer((answer) => Future.value(null));

      final repository = GoogleAuthRepositoryImpl(
        signInService: anySignInService,
      );

      expect(await repository.signOut(), Right(null));
    },
  );

  test("signOut: Quando for solicitado um signOut e algo der errado, deve emitir um AppFailure", () async {
    when(anySignInService.signOut()).thenThrow(Exception("Erro qualquer"));

    final repository = GoogleAuthRepositoryImpl(
      signInService: anySignInService,
    );

    expect(
      await repository.signOut(),
      Left(SignOutFailure(message: "Erro qualquer", statusCode: "500")),
    );
  });
}
