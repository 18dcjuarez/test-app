abstract class Validators {
  // Login validations
  static bool loginValidator({required String user, required String pass}) {
    return userValidator(user) && passValidator(pass);
  }

  static bool userValidator(String user) {
    if (user.isEmpty) return false;
    return true;
  }

  static bool passValidator(String pass) {
    if (pass.isEmpty) return false;
    return true;
  }

  // Form validations
  static bool formValidator({
    required String descripcion,
    required String valor,
    required String comprobar,
    required String fecha,
  }) {
    return descripcionValidator(descripcion) &&
        valorValidator(valor) &&
        comprobarValidator(comprobar) &&
        fechaValidator(fecha);
  }

  static bool descripcionValidator(String v) {
    if (v.isEmpty) return false;
    return true;
  }

  static bool valorValidator(String v) {
    if (v.isEmpty) return false;
    if (int.tryParse(v) == null) return false;
    return true;
  }

  static bool comprobarValidator(String v) {
    if (v.isEmpty) return false;
    if (!v.contains(RegExp(r'[0-1]'))) return false;
    return true;
  }

  static bool fechaValidator(String v) {
    if (v.isEmpty) return false;
    return true;
  }
}
