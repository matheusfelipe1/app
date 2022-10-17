import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/user_model.dart';

abstract class ISignupRepository {
  Future registerUser(Map body, String id);
  Future<UserCredential> registerUid(UserModel user);
}
