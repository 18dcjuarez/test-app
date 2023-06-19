import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_jun17/src/data/routes/app_routes.dart';
import 'package:test_app_jun17/src/store/register/register_store.dart';
import 'package:test_app_jun17/src/theme/styles.dart';
import 'package:test_app_jun17/src/utils/utils.dart';
import 'package:test_app_jun17/src/widgets/widgets.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final registerStore = Provider.of<RegisterStore>(context);
    final date = Utils.registerCardTimeFormater(
        date: registerStore.selectedRegister!.fecha.toString());

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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${registerStore.selectedRegister?.idPrueba}',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Valor: ${registerStore.selectedRegister?.valor}',
              style: Theme.of(context).textTheme.headline2?.copyWith(height: 2),
            ),
            Text(
              'Comp: ${registerStore.selectedRegister?.comprobar == '1' ? 'Si' : 'No'}',
              style:
                  Theme.of(context).textTheme.headline2?.copyWith(height: 1.5),
            ),
            Text(
              'Id Usuario: ${registerStore.selectedRegister?.idUsuario}',
              style:
                  Theme.of(context).textTheme.headline2?.copyWith(height: 1.5),
            ),
            Text(
              'Fecha:',
              style:
                  Theme.of(context).textTheme.headline2?.copyWith(height: 1.5),
            ),
            Text(
              date[0].toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              date[1].toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestAppButton(
                  min: true,
                  callback: registerStore.deleteRegister,
                  backgroundColor: CustomColors.colorRed,
                  text: 'Delete',
                ),
                TestAppButton(
                  min: true,
                  callback: () {
                    registerStore.isEdit = true;
                    registerStore.startControllers();
                    Navigator.pushNamed(context, AppRoutes.formPage);
                  },
                  backgroundColor: CustomColors.mainBlue,
                  text: 'Edit',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
