class ResponseModel {
  ResponseModel({
    this.message = '',
    this.success = true,
    this.data = const <String, dynamic>{},
    this.statusCode = 200,
  });
  final bool success;
  final dynamic data;
  final int statusCode;
  final String message;

  @override
  String toString() {
    return '''success: $success, statusCode: $statusCode, message: $message, data: $data''';
  }
}
