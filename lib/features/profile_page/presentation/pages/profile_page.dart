import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/roboto_text.dart';
import '../../../../core/widgets/size_config.dart';
import '../../../../core/widgets/title_sliver_app_bar.dart';
import '../../../../l10n/l10n.dart';
import '../../../../setup.dart';
import '../../../auth_page/presentation/cubit/account_in_system_cubit.dart';
import '../../../auth_page/presentation/cubit/account_in_system_state.dart';
import '../widgets/person_card.dart';
import '../widgets/profile_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final cubit = getIt<AccountInSystemCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TitleAppBar(
          title: localizationInstance.profile,
          appBarHeight: SizeConfig(context, 60)(),
        ),
        body: BlocBuilder<AccountInSystemCubit, AccountInSystemState>(
            bloc: cubit,
            builder: (context, state) {
              if (state.logged) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RobotoText(
                        localizationInstance.aboutUser,
                        fontSize: 16,
                      ),
                      PersonCard(
                        account: state.accountInSystem,
                      ),
                      const CustomSizedBox(height: 15),
                      ProfileItem(
                        callback: () {
                          cubit.exitFromSystem();
                        },
                        title: localizationInstance.exit,
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: RobotoText(
                    localizationInstance.isNotInSystem,
                    fontSize: 18,
                  ),
                );
              }
            }));
  }
}
