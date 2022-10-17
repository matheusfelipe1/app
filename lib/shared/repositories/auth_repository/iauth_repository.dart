import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<UserCredential> signWithEmailAndPassword(
      String email, String password);
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser();
}
