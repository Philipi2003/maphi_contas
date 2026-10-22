import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/auth/domain/failures/auth_failure.dart';
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
])
void main() {
  final anyRepository = MockAuthRepositoryInterface();
  final anyAccount = MockGoogleSignInAccount();
  final anyGoogleAuthState = MockGoogleAuthState();

  setUp(() {
    provideDummy<Either<AppFailure, GoogleAuthState>>(
      Left(AppFailure(message: "Erro qualquer", statusCode: "500")),
    );
  });

  test(
    'Quando o requestAuthorization dá certo, retorna um Future GoogleAuthState',
    () async {
      when(
        anyRepository.requestAuthorization(authState: anyGoogleAuthState),
      ).thenAnswer(
        (answer) => Future.value(
          Right(GoogleAuthState(currentUser: anyAccount, isAuthorized: true)),
        ),
      );

      final usecase = RequestAuthorizationUsecase(repository: anyRepository);

      expect(
        await usecase.call(authState: anyGoogleAuthState),
        Right(GoogleAuthState(currentUser: anyAccount, isAuthorized: true)),
      );
    },
  );
}
