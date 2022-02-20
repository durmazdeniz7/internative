import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_native/entities/sign_up.dart';
import 'package:inter_native/entities/sign_up_response.dart';
import 'package:inter_native/repo/sign_up_dao.dart';

class SignUpCubit extends Cubit<SignUpResponse> {
  SignUpCubit() : super(SignUpResponse(validationErrors: [], hasError: false, message: "", signup: Signup(token: "")));
  SignUpDao signUpDao = SignUpDao();

  Future<void> signUp(
      String email, String password, String passwordRetry) async {
    SignUpResponse signUpResponse
 =  await signUpDao.signUp(email, password, passwordRetry);
 emit(signUpResponse);
  }
}
