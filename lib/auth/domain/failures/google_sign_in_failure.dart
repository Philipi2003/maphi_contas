import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';

part 'google_sign_in_failure.freezed.dart';

@freezed
class GoogleSignInFailure extends AppFailure with _$GoogleSignInFailure {
  GoogleSignInFailure({super.statusCode, super.message});
}
