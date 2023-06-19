// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:test_app_jun17/src/data/routes/app_routes.dart';
import 'package:test_app_jun17/src/store/login/login_store.dart';
import 'package:test_app_jun17/src/theme/styles.dart';
import 'package:test_app_jun17/src/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    LoginStore loginStore = Provider.of<LoginStore>(context);
    return Material(
        child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CustomColors.mainBlue.withOpacity(0.5),
                CustomColors.colorGrey.withOpacity(0.9),
                CustomColors.mainBlue.withOpacity(0.5)
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width * 0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.rocket_launch_sharp,
                      color: CustomColors.colorWhite,
                      size: screenSize.height * 0.15,
                    ),
                    Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(fontSize: 35, height: 1),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    TestAppFormField(
                      controller: loginStore.userInputTextFieldController,
                      hintText: 'User',
                      capitalization: TextCapitalization.none,
                      onChanged: loginStore.loginFieldsValidation,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    TestAppFormField(
                      controller: loginStore.passInputTextFieldController,
                      hintText: 'Password',
                      showMaskIcon: true,
                      isPassword: true,
                      capitalization: TextCapitalization.none,
                      onChanged: loginStore.loginFieldsValidation,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Observer(
                      builder: ((context) => TestAppButton(
                            text: 'Login',
                            callback: loginStore.isFormValid
                                ? () async {
                                    final resp = await loginStore.login(
                                      user: loginStore
                                          .userInputTextFieldController.text,
                                      password: loginStore
                                          .passInputTextFieldController.text,
                                    );
                                    if (!resp.logged) {
                                      await TestAppFlushbar.showBar(context,
                                          title: 'ERROR',
                                          description: resp.message);
                                    } else {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                        AppRoutes.homePage,
                                        (route) => false,
                                      );
                                    }
                                  }
                                : null,
                            loading: loginStore.isLoading,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
