import 'package:fpdart/fpdart.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';

abstract class AuthRepositoryInterface {
  Stream<Either<AppFailure, GoogleAuthState>> initializeService();
  Future<Either<AppFailure, GoogleAuthState>> requestAuthorization({
    required GoogleAuthState? authState,
  });
  Future<Either<AppFailure, void>> signOut();
}
