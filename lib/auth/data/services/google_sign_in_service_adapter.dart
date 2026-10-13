import 'dart:async';

import 'package:dotenv/dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInService {
  SignInService({required this.googleSignInInstance, required this.env});

  final GoogleSignIn googleSignInInstance;
  final DotEnv env;

  bool isInitialized = false;

  Future<void> attemptLogin() async {
    await googleSignInInstance.attemptLightweightAuthentication();
  }

  Future<void> initialize() async {
    await googleSignInInstance.initialize(clientId: env['CLIENT_ID']);
  }

  Stream<GoogleSignInAuthenticationEvent>
  watchAuthenticationEventsStream() async* {
    yield* googleSignInInstance.authenticationEvents;
  }
}
