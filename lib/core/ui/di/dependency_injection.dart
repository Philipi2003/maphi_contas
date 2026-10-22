import 'package:dotenv/dotenv.dart';
import 'package:maphi_contas/auth/data/repositories/auth_repository_impl.dart';
import 'package:maphi_contas/auth/data/services/sign_in_service.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/auth/domain/usecases/initialize_google_auth_service_usecase.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maphi_contas/auth/domain/usecases/request_authorization_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';

part 'dependency_injection.g.dart';

@riverpod
String helloWorld(Ref ref) {
  return "Hello World, Riverpod";
}

@Riverpod(keepAlive: true)
class CurrentAuthState extends _$CurrentAuthState {
  final container = ProviderContainer();

  @override
  Either<AppFailure, GoogleAuthState> build() {
    final usecase = container.read(initializeGoogleAuthServiceUsecaseProvider);

    usecase.call().listen((event) {
      state = event;
    });

    return Right(
      GoogleAuthState(currentUser: null, isAuthorized: false, httpClient: null),
    );
  }

  Future<Either<AppFailure, void>> requestAuthorization() async {
    final usecase = container.read(requestAuthorizationUsecaseProvider);

    final response = await usecase.call(
      authState: state.getRight().toNullable(),
    );

    state = response;

    if (response.isLeft()) {
      return response;
    }
    return Right(null);
  }
}

@riverpod
InitializeGoogleAuthServiceUsecase initializeGoogleAuthServiceUsecase(Ref ref) {
  final repository = ref.read(authRepositoryProvider);

  return InitializeGoogleAuthServiceUsecase(authRepository: repository);
}

@riverpod
RequestAuthorizationUsecase requestAuthorizationUsecase(Ref ref) {
  final repository = ref.read(authRepositoryProvider);

  return RequestAuthorizationUsecase(repository: repository);
}

@riverpod
AuthRepositoryInterface authRepository(Ref ref) {
  return GoogleAuthRepositoryImpl(
    signInService: ref.read(signInServiceProvider),
  );
}

@riverpod
SignInService signInService(Ref ref) {
  return SignInService(
    googleSignInInstance: ref.read(googleSignInInstanceProvider),
    env: ref.read(dotEnvProvider),
  );
}

@riverpod
GoogleSignIn googleSignInInstance(Ref ref) {
  return GoogleSignIn.instance;
}

@riverpod
DotEnv dotEnv(Ref ref) {
  return DotEnv(includePlatformEnvironment: true)..load(['../../../../.env']);
}
