import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';

part 'auth_failure.freezed.dart';

@freezed
class InitializeServiceFailure extends AppFailure
    with _$InitializeServiceFailure {
  InitializeServiceFailure({super.message});
}

@freezed
class RequestAuthorizationFailure extends AppFailure
    with _$RequestAuthorizationFailure {
  RequestAuthorizationFailure({super.message});
}

@freezed
class SignOutFailure extends AppFailure with _$SignOutFailure {
  SignOutFailure({super.message});
}

@freezed
class GoogleSignInFailure extends AppFailure with _$GoogleSignInFailure {
  GoogleSignInFailure({super.statusCode, super.message});
}

@freezed
class AuthenticationEventFailure extends AppFailure
    with _$AuthenticationEventFailure {
  AuthenticationEventFailure({super.message});
}
