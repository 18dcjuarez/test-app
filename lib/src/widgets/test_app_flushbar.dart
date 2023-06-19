part of 'widgets.dart';

class TestAppFlushbar {
  static dynamic showBar(
    BuildContext context, {
    required String title,
    String? description,
    bool success = false,
    Color color = CustomColors.colorRed,
    Color? titleColor,
    Color? messageColor,
  }) {
    final screenSize = MediaQuery.of(context).size;
    Flushbar<dynamic>(
      titleColor: titleColor,
      messageColor: messageColor,
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(10),
      duration: const Duration(seconds: 3),
      backgroundColor: success ? CustomColors.mainGreen : color,
      shouldIconPulse: false,
      titleText: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontSize: 16,
            ),
        textAlign: success ? TextAlign.center : TextAlign.start,
      ),
      messageText: description == null
          ? Container()
          : Text(
              description,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 16,
                  ),
              textAlign: success ? TextAlign.center : TextAlign.start,
            ),
      margin: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.07,
      ),
    ).show(context);
  }
}
