import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_jun17/src/data/routes/app_routes.dart';
import 'package:test_app_jun17/src/models/register_model.dart';
import 'package:test_app_jun17/src/store/register/register_store.dart';
import 'package:test_app_jun17/src/theme/styles.dart';
import 'package:test_app_jun17/src/utils/utils.dart';

class RegisterCard extends StatelessWidget {
  const RegisterCard({
    Key? key,
    required this.register,
  }) : super(key: key);

  final RegisterModel register;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final date =
        Utils.registerCardTimeFormater(date: register.fecha.toString());
    final registerStore = Provider.of<RegisterStore>(context);
    return GestureDetector(
      onTap: () {
        registerStore.selectedRegister = register;
        Navigator.of(context).pushNamed(AppRoutes.detailPage);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
              colors: [
                CustomColors.mainGreen,
                CustomColors.colorGrey,
                CustomColors.colorGrey,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.03),
                    child: Text(
                      '${register.idPrueba}',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
                Flexible(
                  flex: 16,
                  child: Column(
                    children: [
                      Text(
                        register.descripcion.toString(),
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(
                        height: screenSize.height * 0.006,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Valor: ${register.valor}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            'Comp: ${register.comprobar == '1' ? 'Si' : 'No'}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            'Id Usuario: ${register.idUsuario}',
                            style: Theme.of(context).textTheme.headline4,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Column(
                    children: [
                      Text(date[0].toString(),
                          style: Theme.of(context).textTheme.headline4),
                      Text(date[1].toString(),
                          style: Theme.of(context).textTheme.headline4),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
