import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_auth_state.freezed.dart';

@freezed
class GoogleAuthState with _$GoogleAuthState {
  GoogleAuthState({
    required this.currentUser,
    this.isAuthorized = false, // has granted permissions?
  });

  final GoogleSignInAccount? currentUser;
  final bool isAuthorized;
}
