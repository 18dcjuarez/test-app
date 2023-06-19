import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:test_app_jun17/src/pages/app/app.dart';
import 'package:test_app_jun17/src/store/login/login_store.dart';
import 'package:test_app_jun17/src/store/register/register_store.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    MultiProvider(
      providers: [
        Provider<LoginStore>(create: (_) => LoginStore()),
        Provider<RegisterStore>(create: (context) => RegisterStore()),
      ],
      child: const App(),
    ),
  );
}
