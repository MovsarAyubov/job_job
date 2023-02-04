import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'roboto_text.dart';
import '../../l10n/l10n.dart';

class InternetErrorWidget extends StatelessWidget {
  final VoidCallback callback;
  const InternetErrorWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RobotoText(
            localizationInstance.noInternet,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: blackText,
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(appMainColor)),
            onPressed: callback,
            child: RobotoText(
              localizationInstance.tryAgain,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
