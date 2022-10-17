import 'package:app/models/user_model.dart';
import 'package:app/shared/repositories/auth_repository/auth_repository.dart';
import 'package:app/shared/repositories/auth_repository/iauth_repository.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final IAuthRepository authRepository = AuthRepository();
  UserModel myUser = UserModel();

  sign(String email, String password, BuildContext context) async {
    await authRepository
        .signWithEmailAndPassword(email, password)
        .then((value) async {
      await authRepository.getUser().then((value) {
        myUser = UserModel.fromJson(value.data()!);
        Navigator.pushNamed(context, '/home');
      }).catchError((e) {
        print(e);
      });
    }).catchError((e) {
      print(e);
    });
  }
}
