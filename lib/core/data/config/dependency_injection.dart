import 'package:dotenv/dotenv.dart';
import 'package:maphi_contas/auth/data/repositories/auth_repository_implementation.dart';
import 'package:maphi_contas/auth/data/services/google_sign_in_service_adapter.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/auth/domain/usecases/initialize_google_sign_in_usecase.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  return GoogleAuthRepositoryImplementation();
}

@riverpod
GoogleSignInServiceAdapter googleSignInServiceAdapter(Ref ref){
  return GoogleSignInServiceAdapter(googleSignInInstance: ref.read(googleSignInInstanceProvider), env: ref.read(dotEnvProvider));
}

@riverpod
GoogleSignIn googleSignInInstance(Ref ref){
  return GoogleSignIn.instance;
}

@riverpod
DotEnv dotEnv(Ref ref) {
  return DotEnv(includePlatformEnvironment: true)..load([
    '../../../../.env'
  ]);
}