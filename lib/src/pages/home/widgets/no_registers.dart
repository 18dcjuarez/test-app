import 'package:flutter/material.dart';
import 'package:test_app_jun17/src/theme/styles.dart';

class NoRegisters extends StatelessWidget {
  const NoRegisters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No registers',
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: CustomColors.colorBlack,
                ),
          ),
          Icon(
            Icons.sentiment_dissatisfied_outlined,
            color: CustomColors.colorGrey,
            size: screenSize.height * 0.2,
          )
        ],
      ),
    );
  }
}
