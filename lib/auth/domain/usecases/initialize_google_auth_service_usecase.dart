import 'package:fpdart/fpdart.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';

class InitializeGoogleAuthServiceUsecase {
  InitializeGoogleAuthServiceUsecase({required this.authRepository});

  final AuthRepositoryInterface authRepository;

  Stream<Either<AppFailure, GoogleAuthState>> call() async* {
    yield* authRepository.initializeService();
  }
}
