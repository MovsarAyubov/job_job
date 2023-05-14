import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/size_config.dart';
import '../../../../setup.dart';
import '../../../home_page/presentation/cubit/home_page_cubit.dart';
import '../../../main_page/presentation/pages/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final cubit = getIt<HomePageCubit>();

  @override
  void initState() {
    cubit.fetchVacancies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      pageTransitionType: PageTransitionType.leftToRight,
      backgroundColor: appMainColor,
      duration: 1500,
      splash: CustomSizedBox(
        width: 140,
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: Text(
            "JobJob",
            style: TextStyle(
                fontFamily: "Playfair", fontSize: SizeConfig(context, 32)()),
          ),
        ),
      ),
      nextScreen: const MainPage(),
    );
  }
}
