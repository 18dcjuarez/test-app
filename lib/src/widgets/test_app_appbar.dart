part of 'widgets.dart';

class TestAppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const TestAppAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final loginStore = Provider.of<LoginStore>(context);
    return AppBar(
      backgroundColor: CustomColors.mainBlue,
      toolbarHeight: screenSize.height * 0.2,
      elevation: 0,
      title: Text(title),
      actions: [
        GestureDetector(
          child: const Icon(Icons.power_settings_new_sharp),
          onTap: () => loginStore.logout(),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
