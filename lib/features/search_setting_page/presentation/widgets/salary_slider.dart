// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/roboto_text.dart';
import '../../../../l10n/l10n.dart';
import '../cubit/searching_settings_cubit.dart';

class SalarySlider extends StatefulWidget {
  final SearchingSettingsCubit cubit;
  const SalarySlider({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<SalarySlider> createState() => _SalarySliderState();
}

class _SalarySliderState extends State<SalarySlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RobotoText(
              localizationInstance.preferredSalary,
              fontSize: 16,
            ),
            const CustomSizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: appMainColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: CustomSizedBox(
                  height: 25,
                  width: 90,
                  child: RobotoText(
                    "от ${widget.cubit.salary.round().toString()}",
                    textAlign: TextAlign.center,
                    fontSize: 18,
                  )),
            ),
          ],
        ),
        const CustomSizedBox(height: 10),
        Slider(
          value: widget.cubit.salary,
          max: 300000,
          divisions: 60,
          activeColor: appMainColor,
          label: widget.cubit.salary.round().toString(),
          onChanged: (value) {
            setState(() {
              widget.cubit.salary = value;
            });
          },
        ),
      ],
    );
  }
}
