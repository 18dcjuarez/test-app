import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:test_app_jun17/src/data/routes/app_routes.dart';
import 'package:test_app_jun17/src/pages/home/widgets/no_registers.dart';
import 'package:test_app_jun17/src/pages/home/widgets/register_card.dart';
import 'package:test_app_jun17/src/store/register/register_store.dart';
import 'package:test_app_jun17/src/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RegisterStore _registerStore;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _registerStore.getRegisters(),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _registerStore = Provider.of<RegisterStore>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Observer(
      builder: ((context) => Stack(
            children: [
              Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: const TestAppAppbar(title: 'Home'),
                body: _registerStore.registers.isEmpty &&
                        !_registerStore.isLoading
                    ? const NoRegisters()
                    : SingleChildScrollView(
                        child: Column(
                          children: _registerStore.registers
                              .map((element) => RegisterCard(register: element))
                              .toList(),
                        ),
                      ),
              ),
              Positioned(
                  bottom: screenSize.height * 0.02,
                  right: screenSize.width * 0.05,
                  child: TestAppButton(
                    text: 'Add',
                    min: true,
                    callback: () {
                      _registerStore.isEdit = false;
                      _registerStore.cleanControllers();
                      Navigator.pushNamed(context, AppRoutes.formPage);
                    },
                  )),
              Visibility(
                visible: _registerStore.isLoading,
                child: const TestAppLoader(),
              ),
            ],
          )),
    );
  }
}
