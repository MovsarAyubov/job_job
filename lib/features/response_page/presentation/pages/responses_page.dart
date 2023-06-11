import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_raboty/core/widgets/roboto_text.dart';
import 'package:poisk_raboty/core/widgets/title_sliver_app_bar.dart';
import 'package:poisk_raboty/features/response_page/presentation/cubit/responses_cubit.dart';
import 'package:poisk_raboty/l10n/l10n.dart';

import '../../../../core/widgets/size_config.dart';
import '../../../../setup.dart';
import '../cubit/responses_state.dart';
import '../widgets/response_card.dart';

class ReponsesPage extends StatefulWidget {
  const ReponsesPage({super.key});

  @override
  State<ReponsesPage> createState() => _ReponsesPageState();
}

class _ReponsesPageState extends State<ReponsesPage> {
  final ResponsesCubit cubit = getIt<ResponsesCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
          appBarHeight: SizeConfig(context, 60)(),
          title: localizationInstance.responsePage),
      body: BlocBuilder<ResponsesCubit, ResponsesState>(
          bloc: cubit,
          builder: (context, state) {
            if (state.responses.isNotEmpty) {
              return ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig(context, 15)(),
                    vertical: SizeConfig(context, 20)(),
                  ),
                  itemCount: state.responses.length,
                  itemBuilder: (context, index) {
                    return ResponseCard(
                      vacancy: state.responses[index],
                    );
                  });
            } else {
              return Center(
                child: RobotoText(localizationInstance.noResponses),
              );
            }
          }),
    );
  }
}
