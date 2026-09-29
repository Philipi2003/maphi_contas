import 'package:fpdart/fpdart.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';

class InitializeGoogleSignInUsecase {

  InitializeGoogleSignInUsecase({required this.repository});

  final AuthRepositoryInterface repository;

  Stream<Either<AppFailure, GoogleAuthState>> call() async* {
    yield* repository.initializeGoogleSignIn();
  }
}
