import 'package:flutter/material.dart';
import 'package:videoguysrinath/models/user.dart';
import 'package:videoguysrinath/resources/auth_method.dart';
import 'package:videoguysrinath/resources/firebase_repository.dart';

class UserProvider with ChangeNotifier{
  User _user;
  AuthMethods _authMethods = AuthMethods();
  User get getUser => _user;

  Future<void> refreshUser() async{
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }

}