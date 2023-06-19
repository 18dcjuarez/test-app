import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_app_jun17/src/data/services/generic_service.dart';
import 'package:test_app_jun17/src/models/response_model.dart';

class RegisterService {
  final path = dotenv.env['BASE_URL'].toString();

  Future<ResponseModel> getRegisters(
      {required Map<String, dynamic> body}) async {
    try {
      final resp = await GenericService.instance.post(
        '$path/datos.php',
        body: body,
        headers: {},
        queryParams: {},
      );
      return resp;
    } catch (e) {
      return ResponseModel(
          success: false, statusCode: 404, message: e.toString(), data: {});
    }
  }

  Future<ResponseModel> cudRegister(
      {required Map<String, dynamic> body}) async {
    try {
      final resp = await GenericService.instance.post(
        '$path/prueba.php',
        body: body,
        headers: {},
        queryParams: {},
      );
      return resp;
    } catch (e) {
      return ResponseModel(
          success: false, statusCode: 404, message: e.toString(), data: {});
    }
  }
}
