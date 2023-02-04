// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_raboty/core/app_colors.dart';
import 'package:poisk_raboty/core/cubits/favorites_cached/favorits_state.dart';
import 'package:poisk_raboty/core/widgets/custom_sized_box.dart';
import 'package:poisk_raboty/features/concrete_vacancy/presentation/pages/vacancy_page.dart';
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

import '../cubits/favorites_cached/favorits_cubit.dart';
import 'roboto_text.dart';
import '../../setup.dart';

class VacancyCard extends StatefulWidget {
  final bool isReviwed;
  final VacancyEntity vacancy;
  const VacancyCard({
    Key? key,
    required this.isReviwed,
    required this.vacancy,
  }) : super(key: key);

  @override
  State<VacancyCard> createState() => _VacancyCardState();
}

class _VacancyCardState extends State<VacancyCard> {
  final favoritesCubit = getIt<FavoriteVacancyCubit>();

  @override
  Widget build(BuildContext context) {
    final textColor = widget.isReviwed ? greyText : blackText;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VacancyPage(
              vacancy: widget.vacancy,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RobotoText(
                      widget.vacancy.title,
                      color: textColor,
                      fontSize: 16,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  CustomSizedBox(
                    height: 33,
                    width: 33,
                    child: InkWell(
                      onTap: () {
                        favoritesCubit.addOrRemove(widget.vacancy);
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: BlocBuilder<FavoriteVacancyCubit,
                              FavoriteVacancyState>(
                          bloc: favoritesCubit,
                          builder: (context, state) {
                            return Icon(
                              favoritesCubit.contains(widget.vacancy)
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: favoritesCubit.contains(widget.vacancy)
                                  ? Colors.red
                                  : Colors.grey,
                              size: 28,
                            );
                          }),
                    ),
                  )
                ],
              ),
              RobotoText(
                widget.vacancy.salary,
                color: textColor,
                fontSize: 16,
              ),
              const CustomSizedBox(height: 10),
              RobotoText(widget.vacancy.company, color: textColor),
              const CustomSizedBox(height: 4),
              RobotoText(widget.vacancy.address, color: textColor),
              const CustomSizedBox(height: 15),
              RobotoText(widget.vacancy.description, color: textColor),
            ],
          ),
        ),
      ),
    );
  }
}
