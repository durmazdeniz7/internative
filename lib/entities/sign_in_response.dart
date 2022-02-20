

import 'package:inter_native/entities/sign_in.dart';

class SignInResponse {
  List validationErrors;
  bool hasError;
  String message;
  SignIn? signIn;
  SignInResponse({
    required this.validationErrors,
    required this.hasError,
    required this.message,
    required this.signIn,
  });
  factory SignInResponse.fromJson(Map<String, dynamic> map) {
    return SignInResponse(
        validationErrors: List.from(map['ValidationErrors'] ?? []),
        hasError: map['HasError'] ?? false,
        message: map['Message'] ?? '',
        signIn: SignIn.fromMap(map["Data"]));
  }
}
