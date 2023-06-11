import 'package:flutter/material.dart';
import 'package:poisk_raboty/core/widgets/roboto_text.dart';

class ResumeWidget extends StatelessWidget {
  const ResumeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const RobotoText(
        "+ создать резюме",
        color: Colors.blue,
      ),
    );
  }
}
