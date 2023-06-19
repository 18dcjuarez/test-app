import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_app_jun17/src/data/services/generic_service.dart';
import 'package:test_app_jun17/src/models/login_response_model.dart';

class LoginService {
  final path = dotenv.env['BASE_URL'].toString();
  Future<LoginResponseModel> login({required Map<String, dynamic> body}) async {
    try {
      final resp = await GenericService.instance
          .post('$path/login.php', body: body, headers: {}, queryParams: {});
      return LoginResponseModel.fromJson(resp.data);
    } catch (e) {
      return LoginResponseModel(logged: false, message: 'Error desconocido :(');
    }
  }
}
