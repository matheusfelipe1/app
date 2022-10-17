import 'package:app/models/user_model.dart';
import 'package:app/shared/repositories/signup_repository/isignup_respository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupRepository implements ISignupRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future registerUser(Map body, String id) async {
    return await _firestore.collection('User').doc(id).set(body.cast());
  }

  @override
  Future<UserCredential> registerUid(UserModel user) async {
    return await _auth.createUserWithEmailAndPassword(
        email: user.email!, password: user.passowrd!);
  }
}
