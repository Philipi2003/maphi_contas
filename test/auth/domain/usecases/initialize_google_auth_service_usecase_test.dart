import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/auth/domain/usecases/initialize_google_auth_service_usecase.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepositoryInterface>(),
  MockSpec<GoogleAuthState>(),
  MockSpec<AppFailure>(),
])
import 'initialize_google_auth_service_usecase_test.mocks.dart';

void main() {
  late MockAuthRepositoryInterface anyRepository;
  late MockGoogleAuthState anyGoogleAuthState;
  late MockAppFailure anyAppFailure;

  setUp(() {
    anyRepository = MockAuthRepositoryInterface();
    anyGoogleAuthState = MockGoogleAuthState();
    anyAppFailure = MockAppFailure();
  });

  test("Retorna um GoogleAuthState, quando a operação dá certo", () async {
    when(anyRepository.initializeService())
        .thenAnswer((_) => Stream.value(Right(anyGoogleAuthState)));

    final usecase = InitializeGoogleAuthServiceUsecase(
      authRepository: anyRepository,
    );

    expectLater(usecase.call(), emits(Right(anyGoogleAuthState)));
  });
  test("Retorna um AppFailure, quando a operação dá errado", () async {
    when(anyRepository.initializeService())
        .thenAnswer((_) => Stream.value(Left(anyAppFailure)));

    final usecase = InitializeGoogleAuthServiceUsecase(
      authRepository: anyRepository,
    );

    expectLater(usecase.call(), emits(Left(anyAppFailure)));
  });
}
