import 'dart:async';

import 'package:dotenv/dotenv.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maphi_contas/auth/data/models/google_auth_state_model.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';

class GoogleSignInServiceAdapter {
  GoogleSignInServiceAdapter({required this.googleSignInInstance, required this.env});

  final GoogleSignIn googleSignInInstance;
  final DotEnv env;
  static const List<String> scopes = [
    'https://www.googleapis.com/auth/spreadsheets'
  ];


  Stream<GoogleSignInAuthenticationEvent> initializeAuthenticationEventsStream() async* {
    unawaited(
      googleSignInInstance.initialize(clientId: env['CLIENT_ID']).then((
        _,
      ) {
        yield googleSignInInstance.authenticationEvents

        /// This example always uses the stream-based approach to determining
        /// which UI state to show, rather than using the future returned here,
        /// if any, to conditionally skip directly to the signed-in state.
        googleSignInInstance.attemptLightweightAuthentication();
      }),
    );
  }

  Future<void> _handleAuthenticationEvent(
    GoogleSignInAuthenticationEvent event,
  ) async {
    
    final GoogleSignInAccount? user = switch (event) {
      GoogleSignInAuthenticationEventSignIn() => event.user,
      GoogleSignInAuthenticationEventSignOut() => null,
    };

    if (user == null){
      Either<AppFailure,GoogleAuthStateModel>.of(GoogleAuthStateModel(currentUser: null, isAuthorized: false));
      return;
    }

    final GoogleSignInClientAuthorization? authorization = await user
        .authorizationClient
        .authorizationForScopes(scopes);

    response = Either<AppFailure,GoogleAuthStateModel>.of(GoogleAuthStateModel(currentUser: user, isAuthorized: authorization != null));
    
  }

  Future<void> _handleAuthenticationError(Object e) async {
    setState(() {
      _currentUser = null;
      _isAuthorized = false;
      _errorMessage =
          e is GoogleSignInException
              ? _errorMessageFromSignInException(e)
              : 'Unknown error: $e';
    });
  }

  Future<void> _handleAuthorizeScopes(GoogleSignInAccount user) async {
    try {
      // #docregion RequestScopes
      final GoogleSignInClientAuthorization authorization = await user
          .authorizationClient
          .authorizeScopes(scopes);
      // #enddocregion RequestScopes

      // The returned tokens are ignored since _handleGetContact uses the
      // authorizationHeaders method to re-read the token cached by
      // authorizeScopes. The code above is used as a README excerpt, so shows
      // the simpler pattern of getting the authorization for immediate use.
      // That results in an unused variable, which this statement suppresses
      // (without adding an ignore: directive to the README excerpt).
      // ignore: unnecessary_statements
      authorization;

      setState(() {
        _isAuthorized = true;
        _errorMessage = '';
      });
      unawaited(_handleGetContact(_currentUser!));
    } on GoogleSignInException catch (e) {
      _errorMessage = _errorMessageFromSignInException(e);
    }
  }

}
