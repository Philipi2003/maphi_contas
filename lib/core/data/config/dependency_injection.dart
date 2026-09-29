import 'package:maphi_contas/auth/data/repositories/auth_repository_implementation.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/auth/domain/usecases/initialize_google_sign_in_usecase.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'package:maphi_contas/auth/data/services/google_sign_in.dart';

part 'dependency_injection.g.dart';

@riverpod
String helloWorld(Ref ref) {
  return "Hello World, Riverpod";
}

@riverpod
InitializeGoogleSignInUsecase initializeGoogleSignInUseCase(Ref ref) {
  return InitializeGoogleSignInUsecase(repository: ref.read(authRepositoryProvider));
}

@riverpod
AuthRepositoryInterface authRepository(Ref ref){
  return GoogleAuthRepositoryImplementation(googleSignInInstance: ref.read(googleSignInInstanceProvider));
}

@riverpod
GoogleSignIn googleSignInInstance(Ref ref){
  return GoogleSignIn.instance;
}