abstract class Validators {
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
}
