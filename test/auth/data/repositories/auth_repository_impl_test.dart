import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
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
  MockSpec<AuthClient>(),
])
void main() {
  late MockSignInService anySignInService;
  late MockGoogleSignInAccount anyAccount;
  late MockGoogleSignInClientAuthorization anyClientAuthorization;
  late MockAuthClient anyHttpClient;

  setUp(() {
    anySignInService = MockSignInService();
    anyAccount = MockGoogleSignInAccount();
    anyClientAuthorization = MockGoogleSignInClientAuthorization();
    anyHttpClient = MockAuthClient();
  });

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

  test('initializeService: Quando inicializar a Stream e algo der errado no GoogleSignIn, deve emitir um GoogleSignInFailure', () async {
    when(anySignInService.initialize()).thenThrow(
      GoogleSignInException(code: GoogleSignInExceptionCode.canceled),
    );

    final repository = GoogleAuthRepositoryImpl(
      signInService: anySignInService,
    );

    expectLater(
      repository.initializeService(),
      emits(
        Left(
          GoogleSignInFailure(
            message: "Sign in canceled",
            statusCode: GoogleSignInExceptionCode.canceled.toString(),
          ),
        ),
      ),
    );
  });

  test('initializeService: Quando inicializar a Stream e der um erro qualquer, deve emitir um InitializeServiceFailure', () async {
    when(anySignInService.attemptLogin())
        .thenAnswer((answer) => throw Exception("Erro qualquer"));

    final repository = GoogleAuthRepositoryImpl(
      signInService: anySignInService,
    );

    expectLater(
      repository.initializeService(),
      emits(Left(InitializeServiceFailure(message: "Erro qualquer"))),
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

    when(anySignInService.getAuthClient(anyClientAuthorization))
        .thenReturn(anyHttpClient);

    final repository = GoogleAuthRepositoryImpl(
      signInService: anySignInService,
    );

    expectLater(
      repository.initializeService(),
      emits(
        Right(
          GoogleAuthState(
            currentUser: anyAccount,
            isAuthorized: true,
            httpClient: anyHttpClient,
          ),
        ),
      ),
    );
  });
  test('requestAuthorization: Quando for solicitado um requestAuthorization, deve emitir um GoogleAuthState com o novo authorization', () async {
    when(anySignInService.requestAuthorization(user: anyAccount))
        .thenAnswer((answer) => Future.value(anyClientAuthorization));

    when(anySignInService.getAuthClient(anyClientAuthorization))
        .thenReturn(anyHttpClient);

    final repository = GoogleAuthRepositoryImpl(
      signInService: anySignInService,
    );

    expect(
      await repository.requestAuthorization(
        authState: GoogleAuthState(
          currentUser: anyAccount,
          isAuthorized: false,
          httpClient: anyHttpClient,
        ),
      ),
      Right(
        GoogleAuthState(
          currentUser: anyAccount,
          isAuthorized: true,
          httpClient: anyHttpClient,
        ),
      ),
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
          httpClient: anyHttpClient,
        ),
      ),
      Left(RequestAuthorizationFailure(message: "Erro qualquer")),
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

  test("signOut: Quando for solicitado um signOut e algo der errado, deve emitir um SignOutFailure", () async {
    when(anySignInService.signOut()).thenThrow(Exception("Erro qualquer"));

    final repository = GoogleAuthRepositoryImpl(
      signInService: anySignInService,
    );

    expect(
      await repository.signOut(),
      Left(SignOutFailure(message: "Erro qualquer")),
    );
  });
}
