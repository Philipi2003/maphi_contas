import 'dart:async';

import 'package:dotenv/dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/sheets/v4.dart';

class SignInService {
  SignInService({required this.googleSignInInstance, required this.env});

  final GoogleSignIn googleSignInInstance;
  final DotEnv env;
  static const List<String> scopes = [SheetsApi.driveFileScope];

  Future<GoogleSignInAccount?> attemptLogin() async {
    return await googleSignInInstance.attemptLightweightAuthentication();
  }

  Future<void> initialize() async {
    await googleSignInInstance.initialize(clientId: env['CLIENT_ID']);
  }

  Stream<GoogleSignInAuthenticationEvent>
  watchAuthenticationEventsStream() async* {
    yield* googleSignInInstance.authenticationEvents;
  }

  Future<GoogleSignInClientAuthorization?> authorizationForScopes({
    required GoogleSignInAccount user,
  }) {
    return user.authorizationClient.authorizationForScopes(scopes);
  }

  Future<GoogleSignInClientAuthorization> authorizeScopes({
    required GoogleSignInAccount user,
  }) {
    return user.authorizationClient.authorizeScopes(scopes);
  }
}
