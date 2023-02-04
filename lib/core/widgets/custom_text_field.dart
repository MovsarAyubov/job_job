import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../app_colors.dart';
import '../cubits/form_field_cubit.dart';
import 'custom_sized_box.dart';

class CustomTextField extends StatefulWidget {
  final bool showContent;
  final bool? minLenght;
  final String validationType;
  final TextEditingController controller;
  final String title;
  final void Function(String)? onChanged;
  const CustomTextField({
    Key? key,
    this.showContent = false,
    this.minLenght,
    required this.validationType,
    required this.controller,
    required this.title,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final formFieldCubit = FormFieldCubit();

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: redText, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    );

    return CustomSizedBox(
      height: 50,
      width: double.infinity,
      child: BlocBuilder<FormFieldCubit, bool>(
        bloc: formFieldCubit,
        builder: (context, state) {
          return TextFormField(
            onChanged: widget.onChanged,
            obscureText: widget.showContent ? formFieldCubit.state : false,
            validator: (value) {
              if (value!.isEmpty) {
                return localizationInstance.fieldIsEmpty;
              } else if (!RegExp(widget.validationType).hasMatch(value)) {
                return localizationInstance.unauthorizedCharacters;
              } else if (widget.minLenght ?? false) {
                if (value.length < 6) {
                  return localizationInstance.minLengthError;
                }
              }
              return null;
            },
            controller: widget.controller,
            cursorWidth: 1,
            cursorHeight: 25,
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              labelText: widget.title,
              suffix: widget.showContent
                  ? InkWell(
                      onTap: () {
                        formFieldCubit.showAndHideContent();
                      },
                      child: Icon(formFieldCubit.state
                          ? Icons.visibility_off
                          : Icons.visibility))
                  : null,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              focusedErrorBorder: border.copyWith(
                  borderSide: border.borderSide.copyWith(color: redText)),
              errorBorder: border.copyWith(
                  borderSide: border.borderSide.copyWith(color: redText)),
              focusedBorder: border.copyWith(
                  borderSide: border.borderSide.copyWith(color: Colors.blue)),
              enabledBorder: border.copyWith(
                  borderSide:
                      border.borderSide.copyWith(color: Colors.grey.shade200)),
            ),
          );
        },
      ),
    );
  }
}
