import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_jun17/src/store/register/register_store.dart';
import 'package:test_app_jun17/src/theme/styles.dart';
import 'package:test_app_jun17/src/widgets/widgets.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final registerStore = Provider.of<RegisterStore>(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColors.mainGreen,
            CustomColors.colorGrey,
            CustomColors.colorGrey,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05,
          vertical: screenSize.height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TestAppFormField(
              controller: registerStore.descripcionInputTextFieldController,
              hintText: 'Descripcion',
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            TestAppFormField(
              controller: registerStore.valorInputTextFieldController,
              hintText: 'Valor',
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            TestAppFormField(
              controller: registerStore.comprobarInputTextFieldController,
              hintText: 'Comprobar',
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            TestAppFormField(
              controller: registerStore.fechaInputTextFieldController,
              hintText: 'Fecha',
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            TestAppButton(
                text: 'Send',
                callback: () => registerStore.addOrUpdateRegister())
          ],
        ),
      ),
    );
  }
}
