import 'package:test_app_jun17/src/models/login_response_model.dart';

enum ResponseEnumsKey { login }

extension ResponseEnumsExtension on ResponseEnumsKey {
  dynamic get key {
    switch (this) {
      case ResponseEnumsKey.login:
        return LoginResponseModel();
      default:
        return LoginResponseModel();
    }
  }
}
