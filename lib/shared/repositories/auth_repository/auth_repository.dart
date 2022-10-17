import 'package:app/shared/repositories/auth_repository/iauth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<UserCredential> signWithEmailAndPassword(
      String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() async {
    return await _firebaseFirestore
        .collection('User')
        .doc(_auth.currentUser!.uid)
        .get();
  }
}
