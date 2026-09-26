import 'package:google_sign_in/google_sign_in.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dependency_injection.g.dart';

@riverpod
String helloWorld(Ref ref) {
  return "Hello World, Riverpod";
}

@riverpod
GoogleSignIn googleSignIn(Ref ref) {
  // final env = DotEnv(includePlatformEnvironment: true)..load();

  final GoogleSignIn signIn = GoogleSignIn.instance;

  return signIn;
}
