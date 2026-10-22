import 'dart:async';

import 'package:dotenv/dotenv.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/googleapis_auth.dart';

class SignInService {
  SignInService({required this._googleSignInInstance, required this._env});

  final GoogleSignIn _googleSignInInstance;
  final DotEnv _env;
  static const List<String> _scopes = [SheetsApi.driveFileScope];

  Future<GoogleSignInAccount?> attemptLogin() async {
    return await _googleSignInInstance.attemptLightweightAuthentication();
  }

  Future<void> initialize() async {
    await _googleSignInInstance.initialize(clientId: _env['CLIENT_ID']);
  }

  Stream<GoogleSignInAuthenticationEvent>
  watchAuthenticationEventsStream() async* {
    yield* _googleSignInInstance.authenticationEvents;
  }

  Future<GoogleSignInClientAuthorization?> authorizationForScopes({
    required GoogleSignInAccount user,
  }) {
    return user.authorizationClient.authorizationForScopes(_scopes);
  }

  Future<GoogleSignInClientAuthorization> requestAuthorization({
    required GoogleSignInAccount user,
  }) {
    return user.authorizationClient.authorizeScopes(_scopes);
  }

  Future<void> signOut() async {
    _googleSignInInstance.disconnect();
  }

  AuthClient getAuthClient(GoogleSignInClientAuthorization? authorization) {
    return authorization!.authClient(scopes: _scopes);
  }
}
