import 'package:fpdart/src/either.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';

class GoogleAuthRepositoryImplementation implements AuthRepositoryInterface {

  GoogleAuthRepositoryImplementation();

  @override
  Stream<Either<AppFailure, GoogleAuthState>> initializeGoogleSignIn() {
    // TODO: implement initializeGoogleSignIn
    throw UnimplementedError();
  }
}
