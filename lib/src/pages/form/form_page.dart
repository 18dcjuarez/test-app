import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:test_app_jun17/src/pages/form/widgets/register_form.dart';
import 'package:test_app_jun17/src/store/register/register_store.dart';
import 'package:test_app_jun17/src/widgets/widgets.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerStore = Provider.of<RegisterStore>(context);
    return Observer(
      builder: (_) => Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: TestAppAppbar(
              title: registerStore.isEdit
                  ? 'Edit: ${registerStore.selectedRegister?.idPrueba}'
                  : 'Add',
            ),
            body: const RegisterForm(),
          ),
          Visibility(
            visible: registerStore.isLoading,
            child: const TestAppLoader(),
          )
        ],
      ),
    );
  }
}
