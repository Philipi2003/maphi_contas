// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GoogleUser {


/// Create a copy of GoogleUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleUserCopyWith<GoogleUser> get copyWith => _$GoogleUserCopyWithImpl<GoogleUser>(this as GoogleUser, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GoogleUser;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleUser&&(identical(other.currentUser, _this.currentUser) || other.currentUser == _this.currentUser)&&(identical(other.isAuthorized, _this.isAuthorized) || other.isAuthorized == _this.isAuthorized)&&(identical(other.contactText, _this.contactText) || other.contactText == _this.contactText)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.serverAuthCode, _this.serverAuthCode) || other.serverAuthCode == _this.serverAuthCode));
}


@override
int get hashCode {
  final _this = this as GoogleUser;
  return Object.hash(runtimeType,_this.currentUser,_this.isAuthorized,_this.contactText,_this.errorMessage,_this.serverAuthCode);
}

@override
String toString() {
  final _this = this as GoogleUser;
  return 'GoogleUser(currentUser: ${_this.currentUser}, isAuthorized: ${_this.isAuthorized}, contactText: ${_this.contactText}, errorMessage: ${_this.errorMessage}, serverAuthCode: ${_this.serverAuthCode})';
}


}

/// @nodoc
abstract mixin class $GoogleUserCopyWith<$Res>  {
  factory $GoogleUserCopyWith(GoogleUser value, $Res Function(GoogleUser) _then) = _$GoogleUserCopyWithImpl;
@useResult
$Res call({
 GoogleSignInAccount? currentUser, bool isAuthorized, String contactText, String errorMessage, String serverAuthCode
});




}
/// @nodoc
class _$GoogleUserCopyWithImpl<$Res>
    implements $GoogleUserCopyWith<$Res> {
  _$GoogleUserCopyWithImpl(this._self, this._then);

  final GoogleUser _self;
  final $Res Function(GoogleUser) _then;

/// Create a copy of GoogleUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentUser = freezed,Object? isAuthorized = null,Object? contactText = null,Object? errorMessage = null,Object? serverAuthCode = null,}) {
  return _then(GoogleUser(
currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as GoogleSignInAccount?,isAuthorized: null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,contactText: null == contactText ? _self.contactText : contactText // ignore: cast_nullable_to_non_nullable
as String,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,serverAuthCode: null == serverAuthCode ? _self.serverAuthCode : serverAuthCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



// dart format on
