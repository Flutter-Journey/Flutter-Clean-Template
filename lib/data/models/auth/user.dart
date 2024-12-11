/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-11 07:31:40
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:flutter_clean_architecture_template/domain/entities/auth/user.dart';

class UserModel {
  String? email;
  String? fullName;
  String? imageURL;

  UserModel({
    this.email,
    this.fullName,
    this.imageURL,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    email = data['email'];
    fullName = data['name'];
    imageURL = data['imageURL'];
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      email: email!,
      fullName: fullName!,
      imageURL: imageURL!,
    );
  }
}
