import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/auth/domain/usecases/initialize_google_sign_in_usecase.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<InitializeGoogleSignInUsecase>()])
import 'initialize_google_sign_in_usecase_test.mocks.dart';

void main() {
  test("Retorna um GoogleAuthState, quando a operação dá certo", () async {
    final usecase = MockInitializeGoogleSignInUsecase();

    when(usecase.call()).thenAnswer(
      (_) => Stream.value(
        Either<AppFailure, GoogleAuthState>.of(
          GoogleAuthState(currentUser: null),
        ),
      ),
    );

    Stream<Either<AppFailure, GoogleAuthState>> authState = usecase.call();

    await for (final value in authState) {
      expect(
        value.getOrElse((failure) {
          print(failure);
          return GoogleAuthState(currentUser: null);
        }),
        GoogleAuthState(currentUser: null),
      );
    }
  });
}
