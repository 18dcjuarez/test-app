class RegisterModel {
  RegisterModel({
    this.idPrueba,
    this.descripcion,
    this.valor,
    this.comprobar,
    this.idUsuario,
    this.fecha,
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    idPrueba = json['idPrueba'] as String?;
    descripcion = json['descripcion'] as String?;
    valor = json['valor'] as String?;
    comprobar = json['comprobar'] as String?;
    idUsuario = json['idUsuario'] as String?;
    fecha = json['fecha'] as String?;
  }

  String? idPrueba;
  String? descripcion;
  String? valor;
  String? comprobar;
  String? idUsuario;
  String? fecha;

  @override
  String toString() {
    return '''idPrueba: $idPrueba, descripcion: $descripcion, valor: $valor, comprobar: $comprobar, idUsuario: $idUsuario, fecha: $fecha''';
  }
}
