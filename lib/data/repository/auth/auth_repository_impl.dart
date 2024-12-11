/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-11 07:31:40
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/data/models/auth/create_user_req.dart';
import 'package:flutter_clean_architecture_template/data/models/auth/signin_user_req.dart';
import 'package:flutter_clean_architecture_template/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_clean_architecture_template/domain/repository/auth/auth.dart';
import 'package:flutter_clean_architecture_template/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }
}
