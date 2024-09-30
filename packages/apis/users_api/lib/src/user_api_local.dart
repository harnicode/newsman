// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:user_api/src/response_models/get_users_reponse.dart';
import 'package:user_api/src/response_models/user_model.dart';
import 'package:user_api/src/user_api_abstract.dart';

import 'exception_models/exception_models.dart';

class UserApiLocal extends UserApi {
  final _completer = Completer<List<UserApiUserModel>>();

  final String assetPath;

  UserApiLocal({this.assetPath = 'assets/Users.json'}) {
    rootBundle.loadString(assetPath).then((value) {
      final List<dynamic> data = jsonDecode(value);
      final List<UserApiUserModel> Users = data.map((item) {
        return UserApiUserModel.fromJson(item);
      }).toList();

      _completer.complete(Users);
    }).catchError((error) {
      _completer.completeError(error);
    });
  }

  @override
  Future<UserApiGetUsersResult> getAllUsers() async {
    try {
      final Users = await _completer.future;

      final result = UserApiGetUsersReponse(Users: Users);

      return success(result);
    } catch (e) {
      final exception = UserApiFatalException(
        code: 500,
        message: e.toString(),
        endpoint: '',
      );

      return failure(exception);
    }
  }
}
