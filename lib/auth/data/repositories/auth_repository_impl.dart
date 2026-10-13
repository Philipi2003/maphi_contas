import 'package:fpdart/src/either.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:maphi_contas/auth/data/services/google_sign_in_service_adapter.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';
import 'package:maphi_contas/auth/domain/failures/google_sign_in_failure.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';

class GoogleAuthRepositoryImpl implements AuthRepositoryInterface {
  GoogleAuthRepositoryImpl({required this.signInService});

  final SignInService signInService;

  @override
  Stream<Either<AppFailure, GoogleAuthState>> initializeService() async* {
    // TODO: implement initializeGoogleSignIn
    try {
      await signInService.initialize();
      signInService.attemptLogin();
      yield* _processAuthenticationEvent(
        signInService.watchAuthenticationEventsStream(),
      );
    } on GoogleSignInException catch (e) {
      yield switch (e.code) {
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
    } on Exception catch (e) {
      yield Either<AppFailure, GoogleAuthState>.left(
        AppFailure(statusCode: '500', message: e.toString()),
      );
    }
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
    final GoogleSignInClientAuthorization? authorization = await user
        ?.authorizationClient
        .authorizationForScopes([SheetsApi.driveFileScope]);

    return Either<AppFailure, GoogleAuthState>.of(
      GoogleAuthState(currentUser: user, isAuthorized: authorization != null),
    );
  });
}
