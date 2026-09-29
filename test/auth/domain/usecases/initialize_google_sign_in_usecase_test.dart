import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/core/data/config/dependency_injection.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@GenerateNiceMocks([MockSpec<AuthRepositoryInterface>()])
import 'initialize_google_sign_in_usecase_test.mocks.dart';

void main() {
  test("Retorna um GoogleAuthState, quando a operação dá certo", () async {
    final repository = MockAuthRepositoryInterface();

    when(repository.initializeGoogleSignIn()).thenAnswer(
      (_) => Stream.value(
        Either<AppFailure, GoogleAuthState>.of(
          GoogleAuthState(currentUser: null),
        ),
      ),
    );

    final container = ProviderContainer.test(
      overrides: [authRepositoryProvider.overrideWith((_) => repository)],
    );

    Stream<Either<AppFailure, GoogleAuthState>> authState = container
        .read(initializeGoogleSignInUseCaseProvider)
        .call();

    await for (final value in authState) {
      assert(value.isRight());
    }
  });
  test("Retorna um AppFailure, quando a operação dá errado", () async {
    final repository = MockAuthRepositoryInterface();

    when(repository.initializeGoogleSignIn()).thenAnswer(
      (_) => Stream.value(
        Either<AppFailure, GoogleAuthState>.left(AppFailure(message: "Erro genérico",statusCode: "007"))
      ),
    );

    final container = ProviderContainer.test(
      overrides: [authRepositoryProvider.overrideWith((_) => repository)],
    );

    Stream<Either<AppFailure, GoogleAuthState>> authState = container
        .read(initializeGoogleSignInUseCaseProvider)
        .call();

    await for (final value in authState) {
      assert(value.isLeft());
    }
  });
}
