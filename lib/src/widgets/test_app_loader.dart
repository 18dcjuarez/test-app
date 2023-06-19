part of 'widgets.dart';

class TestAppLoader extends StatelessWidget {
  const TestAppLoader({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: CustomColors.colorGrey.withOpacity(0.7)),
      child: Pulse(
        infinite: true,
        child: Icon(
          Icons.rocket_launch_sharp,
          size: screenSize.height * 0.2,
          color: CustomColors.mainLime,
        ),
      ),
    );
  }
}
