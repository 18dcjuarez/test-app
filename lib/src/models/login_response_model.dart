class LoginResponseModel {
  LoginResponseModel({
    this.logged = false,
    this.idUsuario,
    this.token,
    this.message,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    logged = json['logged'] as bool;
    idUsuario = json['idUsuario'] as String?;
    token = json['token'] as String?;
    message = json['message'] as String?;
  }
  late bool logged;
  String? idUsuario;
  String? token;
  String? message;

  @override
  String toString() {
    return '''logged: $logged, idUsuario: $idUsuario, token: $token, message: $message''';
  }
}
