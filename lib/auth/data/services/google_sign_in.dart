import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_sign_in.g.dart';

@riverpod
GoogleSignIn googleSignInInstance(Ref ref) {
  // final env = DotEnv(includePlatformEnvironment: true)..load();

  final GoogleSignIn signIn = GoogleSignIn.instance;

  return signIn;
}
