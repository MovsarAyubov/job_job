// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:poisk_raboty/core/app_colors.dart';

import 'package:poisk_raboty/features/search_setting_page/presentation/cubit/searching_settings_cubit.dart';

class MyDropdownButton extends StatefulWidget {
  final SearchingSettingsCubit cubit;
  final List<String> cities;
  const MyDropdownButton({
    Key? key,
    required this.cubit,
    this.cities = const [],
  }) : super(key: key);

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  late String dropValue;

  @override
  void initState() {
    dropValue = widget.cities.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      underline: Container(
        height: 2,
        color: appMainColor,
      ),
      onChanged: (String? value) {
        setState(() {
          dropValue = value!;
          widget.cubit.city = value;
        });
      },
      items: widget.cities.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
