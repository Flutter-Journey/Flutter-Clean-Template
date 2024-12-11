/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-11 07:31:40
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_template/data/models/auth/signin_user_req.dart';
import 'package:flutter_clean_architecture_template/domain/repository/auth/auth.dart';
import 'package:flutter_clean_architecture_template/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
