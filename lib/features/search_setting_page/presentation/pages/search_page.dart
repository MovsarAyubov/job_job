import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/roboto_text.dart';
import '../../../../core/widgets/size_config.dart';
import '../../../../core/widgets/title_sliver_app_bar.dart';
import '../../../../l10n/l10n.dart';
import '../../../../setup.dart';
import '../../../home_page/presentation/cubit/home_page_cubit.dart';
import '../../../main_page/presentation/pages/main_page.dart';
import '../cubit/searching_settings_cubit.dart';
import '../widgets/drop_down_button.dart';
import '../widgets/my_search_field.dart';
import '../widgets/salary_slider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final cubit = getIt<HomePageCubit>();
  final searchingSettingsCubit = SearchingSettingsCubit();

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TitleAppBar(
          title: localizationInstance.searchPage,
          appBarHeight: SizeConfig(context, 60)(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySearchField(
                controller: textController,
              ),
              const CustomSizedBox(height: 10),
              const Divider(height: 2),
              const CustomSizedBox(height: 10),
              SalarySlider(cubit: searchingSettingsCubit),
              const CustomSizedBox(height: 10),
              const Divider(height: 2),
              const CustomSizedBox(height: 10),
              RobotoText(
                localizationInstance.area,
                fontSize: 16,
              ),
              const CustomSizedBox(height: 10),
              MyDropdownButton(
                cubit: searchingSettingsCubit,
                cities: searchingSettingsCubit.cities,
              ),
              const CustomSizedBox(height: 10),
              const Divider(height: 2),
              const Expanded(child: SizedBox()),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(appMainColor)),
                        onPressed: () {
                          searchingSettingsCubit.settingSearch();
                          cubit.deletePreviousDataAndDownloadNewOnes(
                              job: textController.text,
                              salary: searchingSettingsCubit.state.salary,
                              area: searchingSettingsCubit.state.areaOfSearch);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const MainPage()),
                              ModalRoute.withName(""));
                        },
                        child: RobotoText(
                          localizationInstance.search,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
