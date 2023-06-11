import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_colors.dart';
import '../../../../l10n/l10n.dart';
import '../../../favorites_page/presentation/pages/favorites_page.dart';
import '../../../home_page/presentation/pages/home_page.dart';
import '../../../profile_page/presentation/pages/profile_page.dart';
import '../../../response_page/presentation/pages/responses_page.dart';
import '../cubit/main_page_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageController = PageController();
  final mainPageCubit = MainPageCubit();

  final screens = <Widget>[
    const HomePage(),
    const FavoritesPage(),
    const ReponsesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
        bloc: mainPageCubit,
        builder: (context, state) {
          return Scaffold(
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              selectedIconTheme:
                  const IconThemeData(size: 30, color: appMainColor),
              unselectedIconTheme: const IconThemeData(size: 22),
              selectedFontSize: 16,
              unselectedFontSize: 13,
              showSelectedLabels: true,
              fixedColor: appMainColor,
              onTap: (index) {
                mainPageCubit.changePage(index);
                pageController.jumpToPage(index);
              },
              currentIndex: state.pageIndex,
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(Icons.search),
                    label: localizationInstance.search),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.favorite),
                    label: localizationInstance.favorites),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.document_scanner_sharp),
                    label: localizationInstance.responsePage),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.person),
                    label: localizationInstance.profile),
              ],
            ),
          );
        });
  }
}
