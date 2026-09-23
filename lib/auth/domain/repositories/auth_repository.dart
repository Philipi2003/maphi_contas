import 'package:fpdart/fpdart.dart';
import 'package:maphi_contas/auth/domain/entities/google_user.dart';
import 'package:maphi_contas/core/domain/entities/app_failure.dart';

abstract class AuthRepository {
  Future<Either<AppFailure, GoogleUser>> signIn();
  Future<Either<AppFailure, GoogleUser>> signOut();
}
