import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maphi_contas/auth/domain/entities/google_auth_state.dart';

part 'google_auth_state_model.freezed.dart';
// part 'google_auth_state_model.g.dart';

// @JsonSerializable(createJsonSchema: true)
@freezed
class GoogleAuthStateModel extends GoogleAuthState with _$GoogleAuthStateModel{
  GoogleAuthStateModel({
    super.currentUser,
    super.isAuthorized
  });

  factory GoogleAuthStateModel.fromMap(Map<String,dynamic> map) {
    return GoogleAuthStateModel(currentUser: map['currentUser'],isAuthorized: map['isAuthorized']);
  }

  Map<String, dynamic> toMap(){
    return {
      'currentUser': currentUser,
      'isAuthorized': isAuthorized
    };
  }
  
  // factory GoogleAuthStateModel.fromJson(Map<String, dynamic> json) => _$GoogleAuthStateModelFromJson(json);

  // Map<String, dynamic> toJson() => _$GoogleAuthStateModelToJson(this);

  // static const jsonSchema = _$GoogleAuthStateModelJsonSchema;
}