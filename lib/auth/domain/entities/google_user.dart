import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_user.freezed.dart';

@freezed
class GoogleUser({
  final GoogleSignInAccount? currentUser,
  final bool isAuthorized = false, // has granted permissions?
  final String contactText = '',
  final String errorMessage = '',
  final String serverAuthCode = '',
}) with _$GoogleUser;
