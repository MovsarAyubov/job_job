// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:poisk_raboty/core/app_colors.dart';
import 'package:poisk_raboty/l10n/l10n.dart';

class MySearchField extends StatefulWidget {
  final TextEditingController controller;
  const MySearchField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<MySearchField> createState() => _MySearchFieldState();
}

class _MySearchFieldState extends State<MySearchField> {
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: redText, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    );

    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return localizationInstance.fieldIsEmpty;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: localizationInstance.jobSearchByName,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        focusedErrorBorder: border.copyWith(
            borderSide: border.borderSide.copyWith(color: redText)),
        errorBorder: border.copyWith(
            borderSide: border.borderSide.copyWith(color: redText)),
        focusedBorder: border.copyWith(
            borderSide: border.borderSide.copyWith(color: Colors.blue)),
        enabledBorder: border.copyWith(
            borderSide:
                border.borderSide.copyWith(color: Colors.grey.shade400)),
      ),
    );
  }
}
