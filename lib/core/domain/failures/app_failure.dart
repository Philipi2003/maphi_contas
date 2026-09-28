import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
class AppFailure with _$AppFailure {
  AppFailure({this.message, this.statusCode});

  final String? message;
  final String? statusCode;

  @override
  String toString() {
    // TODO: implement toString
    return "$statusCode: $message";
  }
}
