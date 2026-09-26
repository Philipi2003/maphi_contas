import 'package:fpdart/fpdart.dart';
import 'package:maphi_contas/auth/domain/entities/google_user.dart';
import 'package:maphi_contas/core/domain/entities/app_failure.dart';

class SignInUseCase {
  Future<Either<AppFailure, GoogleUser>> call() {
    throw UnimplementedError();
  }
}
