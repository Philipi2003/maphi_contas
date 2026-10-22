import 'package:fpdart/fpdart.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';

class SignOutUsecase {
  SignOutUsecase({required this.repository});

  final AuthRepositoryInterface repository;

  Future<Either<AppFailure, void>> call() {
    return repository.signOut();
  }
}
