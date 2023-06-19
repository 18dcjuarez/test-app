import 'dart:convert';

import 'package:crypto/crypto.dart';

abstract class Utils {
  static String passwordHash({required String password}) {
    return md5.convert(utf8.encode(password)).toString();
  }

  static List<dynamic> registerCardTimeFormater({required String date}) {
    final timeFormated = [];
    timeFormated.add(
        '${date.substring(8, 10)}-${date.substring(5, 7)}-${date.substring(0, 4)}');
    timeFormated.add(date.substring(11));
    return timeFormated;
  }
}
