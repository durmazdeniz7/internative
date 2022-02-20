

import 'package:inter_native/entities/sign_up.dart';

class SignUpResponse {
  List validationErrors;
  bool hasError;
  String message;
  Signup? signup;
  SignUpResponse({
    required this.validationErrors,
    required this.hasError,
    required this.message,
    required this.signup,
  });
  factory SignUpResponse.fromJson(Map<String, dynamic> map) {
    return SignUpResponse(
        validationErrors: List.from(map['ValidationErrors'] ?? []),
        hasError: map['HasError'] ?? false,
        message: map['Message'] ?? '',
        signup: Signup.fromMap(map["Data"]));
  }
}
