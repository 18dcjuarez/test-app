import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TestAppFormField(
                controller: registerStore.descripcionInputTextFieldController,
                hintText: 'Descripcion',
                onChanged: registerStore.validateForm,
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              TestAppFormField(
                controller: registerStore.valorInputTextFieldController,
                hintText: 'Valor',
                onChanged: registerStore.validateForm,
                inputType: TextInputType.number,
                formaters: [
                  FilteringTextInputFormatter.allow(
                    RegExp('[0-9]'),
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              TestAppFormField(
                controller: registerStore.comprobarInputTextFieldController,
                hintText: 'Comprobar',
                onChanged: registerStore.validateForm,
                inputType: TextInputType.number,
                formaters: [
                  FilteringTextInputFormatter.allow(
                    RegExp('[0-1]'),
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              TestAppFormField(
                controller: registerStore.fechaInputTextFieldController,
                hintText: 'Fecha',
                onChanged: registerStore.validateForm,
                inputType: TextInputType.datetime,
                formaters: [
                  FilteringTextInputFormatter.allow(
                    RegExp('[0-9-() ]'),
                  ),
                  TextInputMask(mask: '9999-99-99 99:99:99'),
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              Observer(
                builder: ((context) => TestAppButton(
                      text: 'Send',
                      callback: registerStore.isFormValid
                          ? () => registerStore.addOrUpdateRegister()
                          : null,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
