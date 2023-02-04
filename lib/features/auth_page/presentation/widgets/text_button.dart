import 'package:flutter/material.dart';

import '../../../../core/widgets/roboto_text.dart';

class MyTextButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  const MyTextButton({
    Key? key,
    required this.title,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      child: RobotoText(
        title,
        color: Colors.blue,
      ),
    );
  }
}
