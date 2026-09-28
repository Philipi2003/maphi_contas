import 'package:maphi_contas/auth/data/repositories/auth_repository_implementation.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/auth/domain/usecases/initialize_google_sign_in_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'package:maphi_contas/auth/data/services/google_sign_in.dart';

part 'dependency_injection.g.dart';

@riverpod
String helloWorld(Ref ref) {
  return "Hello World, Riverpod";
}

@riverpod
AuthRepositoryInterface authRepository(Ref ref) {
  return AuthRepositoryImplementation();
}

@riverpod
InitializeGoogleSignInUsecase initializeGoogleSignIn(Ref ref) {
  return InitializeGoogleSignInUsecase();
}
