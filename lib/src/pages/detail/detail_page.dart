import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:test_app_jun17/src/pages/detail/widgets/detail_card.dart';
import 'package:test_app_jun17/src/store/register/register_store.dart';
import 'package:test_app_jun17/src/widgets/widgets.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerStore = Provider.of<RegisterStore>(context);
    return Observer(
      builder: (_) => Stack(
        children: [
          const Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: TestAppAppbar(title: 'Detail'),
            body: DetailCard(),
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
