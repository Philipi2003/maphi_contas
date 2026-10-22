import 'package:google_sign_in/google_sign_in.dart';
import 'package:maphi_contas/auth/data/services/sign_in_service.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/auth/domain/failures/auth_failure.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';
import 'package:fpdart/fpdart.dart';

class GoogleAuthRepositoryImpl implements AuthRepositoryInterface {
  GoogleAuthRepositoryImpl({required this._signInService});

  final SignInService _signInService;

  @override
  Stream<Either<AppFailure, GoogleAuthState>> initializeService() async* {
    try {
      await _signInService.initialize();
      _signInService.attemptLogin();
      yield* _processAuthenticationEvent(
        _signInService.watchAuthenticationEventsStream(),
      );
    } on GoogleSignInException catch (e) {
      yield _handleExceptionReturnGoogleSignInException(e);
    } on Exception catch (e) {
      yield Left(
        InitializeServiceFailure(
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
      try {
        final GoogleSignInAccount? user = switch (event) {
          GoogleSignInAuthenticationEventSignIn() => event.user,
          GoogleSignInAuthenticationEventSignOut() => null,
        };

        if (user == null) {
          return Right(GoogleAuthState(currentUser: null, isAuthorized: false));
        }

        final GoogleSignInClientAuthorization? authorization =
            await _signInService.authorizationForScopes(user: user);

        return Right(
          GoogleAuthState(
            currentUser: user,
            isAuthorized: authorization != null,
          ),
        );
      } on Exception catch (e) {
        return Left(
          AuthenticationEventFailure(
            message: e.toString().replaceFirst("Exception: ", ""),
            statusCode: "500",
          ),
        );
      }
    });
  }

  Either<AppFailure, GoogleAuthState>
  _handleExceptionReturnGoogleSignInException(GoogleSignInException e) {
    return switch (e.code) {
      GoogleSignInExceptionCode.canceled => Left(
        GoogleSignInFailure(
          statusCode: GoogleSignInExceptionCode.canceled.toString(),
          message: 'Sign in canceled',
        ),
      ),
      _ => Left(
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
      // final GoogleSignInClientAuthorization authorization = await _signInService.requestAuthorization(user: authState.currentUser!);
      await _signInService.requestAuthorization(user: authState.currentUser!);
      return Right(
        GoogleAuthState(currentUser: authState.currentUser, isAuthorized: true),
      );
    } on Exception catch (e) {
      return Left(
        RequestAuthorizationFailure(
          statusCode: '500',
          message: e.toString().replaceFirst("Exception: ", ""),
        ),
      );
    }
  }

  @override
  Future<Either<AppFailure, void>> signOut() async {
    try {
      await _signInService.signOut();
      return Right(null);
    } on Exception catch (e) {
      return Left(
        SignOutFailure(
          statusCode: "500",
          message: e.toString().replaceAll("Exception: ", ""),
        ),
      );
    }
  }
}
