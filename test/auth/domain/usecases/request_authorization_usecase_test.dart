import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/auth/domain/usecases/request_authorization_usecase.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'request_authorization_usecase_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepositoryInterface>(),
  MockSpec<GoogleSignInAccount>(),
  MockSpec<GoogleAuthState>(),
  MockSpec<AppFailure>(),
  MockSpec<AuthClient>(),
])
void main() {
  late MockAuthRepositoryInterface anyRepository;
  late MockGoogleSignInAccount anyAccount;
  late MockGoogleAuthState anyGoogleAuthState;
  late MockAppFailure anyAppFailure;
  late MockAuthClient anyAuthClient;

  setUp(() {
    provideDummy<Either<AppFailure, GoogleAuthState>>(
      Left(AppFailure(message: "Erro qualquer", statusCode: "500")),
    );
    anyRepository = MockAuthRepositoryInterface();
    anyAccount = MockGoogleSignInAccount();
    anyGoogleAuthState = MockGoogleAuthState();
    anyAppFailure = MockAppFailure();
    anyAuthClient = MockAuthClient();
  });

  test(
    'Quando o requestAuthorization dá certo, retorna um Future GoogleAuthState',
    () async {
      when(anyRepository.requestAuthorization(authState: anyGoogleAuthState))
          .thenAnswer(
            (answer) => Future.value(
              Right(
                GoogleAuthState(
                  currentUser: anyAccount,
                  isAuthorized: true,
                  httpClient: anyAuthClient,
                ),
              ),
            ),
          );

      final usecase = RequestAuthorizationUsecase(repository: anyRepository);

      expect(
        await usecase.call(authState: anyGoogleAuthState),
        Right(
          GoogleAuthState(
            currentUser: anyAccount,
            isAuthorized: true,
            httpClient: anyAuthClient,
          ),
        ),
      );
    },
  );

  test(
    'Quando o requestAuthorization dá errado, retorna um AppFailure',
    () async {
      when(anyRepository.requestAuthorization(authState: anyGoogleAuthState))
          .thenAnswer((realInvocation) => Future.value(Left(anyAppFailure)));

      final usecase = RequestAuthorizationUsecase(repository: anyRepository);

      expect(
        await usecase.call(authState: anyGoogleAuthState),
        Left(anyAppFailure),
      );
    },
  );
}
