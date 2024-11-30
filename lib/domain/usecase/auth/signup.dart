import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_template/data/models/auth/create_user_req.dart';
import 'package:flutter_clean_architecture_template/domain/repository/auth/auth.dart';
import 'package:flutter_clean_architecture_template/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
