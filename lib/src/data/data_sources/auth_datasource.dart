import 'package:blogbox/src/domain/repositories/auth_repository.dart';
import 'package:blogbox/src/domain/use_cases/exceptions/auth_exceptions/signup_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthDataSource implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  /// delete user account
  @override
  Future<void> deleteAccount() async  {
    try{
      User? user = getCurrentUser();
      if(user != null) {
        await user.delete();
      }
    }catch(e){
      throw Exception(e);
    }
  }

  /// reset user account password
  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      debugPrint("Password Reset Exception: $e");
    }
  }

  /// sign in with email and password and return usercredential
  @override
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw SignUpException('Login Error: $e');
    }
  }

  /// signout user
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// signup with email and password
  @override
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw SignUpException('SignUp Error: $e');
    }
  }

  /// update user info
  @override
  Future<void> updateUserInfo(String displayName, String photoUrl) async {
    try {
      User? user = getCurrentUser();
      if (user != null) {
        await user.updateDisplayName(displayName);
        await user.updatePhotoURL(photoUrl);
      }
    } catch (e) {
      debugPrint("Update User Info Exception: $e");
      throw Exception(e);
    }
  }
}