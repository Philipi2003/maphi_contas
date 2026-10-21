import 'package:fpdart/src/either.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maphi_contas/auth/data/services/sign_in_service.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/auth/domain/failures/google_sign_in_failure.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/core/data/config/dependency_injection.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';

class GoogleAuthRepositoryImpl implements AuthRepositoryInterface {
  GoogleAuthRepositoryImpl({required this._signInService});

  final SignInService _signInService;

  @override
  Stream<Either<AppFailure, GoogleAuthState>> initializeService() async* {
    // TODO: implement initializeGoogleSignIn
    try {
      await _signInService.initialize();
      _signInService.attemptLogin();
      yield* _processAuthenticationEvent(
        _signInService.watchAuthenticationEventsStream(),
      );
    } on GoogleSignInException catch (e) {
      yield _handleExceptionReturnGoogleSignInException(e);
    } on Exception catch (e) {
      yield Either<AppFailure, GoogleAuthState>.left(
        AppFailure(
          statusCode: '500',
          message: e.toString().replaceFirst("Exception: ", ""),
        ),
      );
    }
  }

  Stream<Either<AppFailure, GoogleAuthState>> _processAuthenticationEvent(
    Stream<GoogleSignInAuthenticationEvent> stream,
  ) async* {
    yield* stream.asyncMap((event) async {
      final GoogleSignInAccount? user = switch (event) {
        GoogleSignInAuthenticationEventSignIn() => event.user,
        GoogleSignInAuthenticationEventSignOut() => null,
      };

      if (user == null) {
        return Either<AppFailure, GoogleAuthState>.of(
          GoogleAuthState(currentUser: null, isAuthorized: false),
        );
      }

      final GoogleSignInClientAuthorization? authorization =
          await _signInService.authorizationForScopes(user: user);

      return Either<AppFailure, GoogleAuthState>.of(
        GoogleAuthState(currentUser: user, isAuthorized: authorization != null),
      );
    });
  }

  Either<AppFailure, GoogleAuthState>
  _handleExceptionReturnGoogleSignInException(GoogleSignInException e) {
    return switch (e.code) {
      GoogleSignInExceptionCode.canceled =>
        Either<AppFailure, GoogleAuthState>.left(
          GoogleSignInFailure(
            statusCode: GoogleSignInExceptionCode.canceled.toString(),
            message: 'Sign in canceled',
          ),
        ),
      _ => Either<AppFailure, GoogleAuthState>.left(
        GoogleSignInFailure(
          statusCode: e.code.toString(),
          message: e.description,
        ),
      ),
    };
  }

  @override
  Future<Either<AppFailure, GoogleAuthState>> requestAuthorization({
    required GoogleAuthState authState,
  }) async {
    try {
      final GoogleSignInClientAuthorization authorization = await _signInService
          .requestAuthorization(user: authState.currentUser!);
      return Either<AppFailure, GoogleAuthState>.of(
        GoogleAuthState(currentUser: authState.currentUser, isAuthorized: true),
      );
    } on Exception catch (e) {
      return Either<AppFailure, GoogleAuthState>.left(
        AppFailure(
          statusCode: '500',
          message: e.toString().replaceFirst("Exception: ", ""),
        ),
      );
    }
  }

  @override
  Future<Either<AppFailure, void>> signOut() async {
    // TODO: implement signOut
    try {
      await _signInService.signOut();
      return Either<AppFailure, void>.of(null);
    } on Exception catch (e) {
      return Either<AppFailure, void>.left(
        AppFailure(
          statusCode: "500",
          message: e.toString().replaceAll("Exception: ", ""),
        ),
      );
    }
  }
}
