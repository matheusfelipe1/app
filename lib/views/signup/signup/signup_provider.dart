import 'package:app/models/user_model.dart';
import 'package:app/shared/repositories/signup_repository/isignup_respository.dart';
import 'package:app/shared/repositories/signup_repository/signup_repository.dart';
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  final ISignupRepository _signupRepository = SignupRepository();
  UserModel user = UserModel();

  register(BuildContext context) async {
    await _signupRepository.registerUid(user).then((value) async {
      user.id = value.user!.uid;
      await _signupRepository.registerUser(user.toJson(), user.id!);
      Navigator.of(context).pop();
    }).catchError((err) {
      print(err);
    });
  }
}
