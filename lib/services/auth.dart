import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:viste/models/UserModel.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // UserModel _userFromFireBase(User user){
  //   return user!=null? UserModel(Id: user.uid):null;
  // }

  Future Register(UserModel MyUser) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: MyUser.Email,
          password: MyUser.Password);
      User firebaseUser = result.user;
          if (firebaseUser != null){
            MyUser.Id = firebaseUser.uid;
          }else {
            return null;
          }
    } catch(e){
      print('HERE ${e.toString()}');
    }
  }

}

