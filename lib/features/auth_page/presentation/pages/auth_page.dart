import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_raboty/core/widgets/size_config.dart';
import 'package:poisk_raboty/core/widgets/title_sliver_app_bar.dart';
import 'package:poisk_raboty/l10n/l10n.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/roboto_text.dart';
import '../../../../setup.dart';
import '../../../../validation/validation_type.dart';
import '../cubit/auth_page_cubit.dart';
import '../cubit/auth_page_state.dart';
import '../widgets/greeting_text.dart';
import '../widgets/text_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final authPageCubit = getIt<AuthPageCubit>();

  void clear() {
    userNameController.clear();
    passwordController.clear();
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: RobotoText(
      authPageCubit.state.signInOrUp == SignInOrUp.signUp
          ? authPageCubit.isUserNameExist
              ? localizationInstance.userNameTaken
              : localizationInstance.successReg
          : authPageCubit.isUserExist
              ? localizationInstance.successSignIn
              : localizationInstance.incorrectData,
      fontSize: 16,
      color: Colors.white,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        title: localizationInstance.auth,
        appBarHeight: SizeConfig(context, 60)(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            const GreetingText(),
            const SizedBox(
              height: 40,
            ),
            Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: formKey,
              child: BlocBuilder<AuthPageCubit, AuthPageState>(
                  bloc: authPageCubit,
                  builder: (context, state) {
                    return Column(
                      children: [
                        CustomTextField(
                          validationType: LettersAndDash.lettersAndDash,
                          controller: userNameController,
                          onChanged: (str) => authPageCubit.entity.name = str,
                          title: localizationInstance.userName,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          showContent: true,
                          validationType: LettersAndNumbers.lettersAndNumbers,
                          controller: passwordController,
                          minLenght: true,
                          title: localizationInstance.password,
                          onChanged: (str) => authPageCubit.entity.pwd = str,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Expanded(
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          appMainColor)),
                                  onPressed: () {
                                    if (formKey.currentState?.validate() !=
                                        true) {
                                      return;
                                    }
                                    showSnackBar();
                                    if (authPageCubit.isSigningUp &&
                                        !authPageCubit.isUserNameExist) {
                                      authPageCubit.signUp();
                                      clear();
                                      authPageCubit.signInOrUp();
                                    } else if (authPageCubit.isSigningIn &&
                                        authPageCubit.isUserExist) {
                                      authPageCubit.signIn();
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: RobotoText(
                                      state.signInOrUp == SignInOrUp.signUp
                                          ? localizationInstance.signUp
                                          : localizationInstance.signIn)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RobotoText(
                              state.signInOrUp == SignInOrUp.signUp
                                  ? localizationInstance.haveAnAccount
                                  : localizationInstance.haveNotAccount,
                              color: blackText,
                              fontSize: 16,
                            ),
                            MyTextButton(
                                title: state.signInOrUp == SignInOrUp.signUp
                                    ? localizationInstance.signIn
                                    : localizationInstance.signUp,
                                callback: () {
                                  authPageCubit.signInOrUp();
                                })
                          ],
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
