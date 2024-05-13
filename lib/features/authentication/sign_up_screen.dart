import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/common/auth_buttons_by_orientation.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/utils/navigator_redirection.dart';
import 'package:tiktok_clone/utils/theme_mode.dart';
import 'package:tiktok_clone/utils/widgets/regulated_max_width.dart';

class SignUpScreen extends ConsumerWidget {
  static const String routeURL = '/';
  static const String routeName = 'signUp';

  const SignUpScreen({super.key});

  void _onTapLogin(BuildContext context) async {
    // context.push(LoginScreen.routeURL);

    goToRouteNamed(
      context: context,
      routeName: LoginScreen.routeName,
    );

    // redirectToRoute(context: context, route: LoginScreen.routeName);
    // redirectToScreen(context: context, targetScreen: const LoginScreen());
    // final result = await Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const LoginScreen(),
    //   ),
    // );
    //
    // print('User Came Back From Login Page');
  }

  void _onTapEmailAndPassword(BuildContext context) {
    redirectToScreen(
      context: context,
      targetScreen: const UsernameScreen(),
    );
    // goToRouteNamed(
    //   context: context,
    //   routeName: UsernameScreen.routeName,
    // );
    // context.push('/user/jenna?show=likes');

    // redirectToRoute(context: context, route: UsernameScreen.routeName);
    // routeWithFadeSlideAnimation(
    //   context: context,
    //   targetScreen: const UsernameScreen(),
    // );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        body: SafeArea(
          child: RegulatedMaxWidth(
            maxWidth: Breakpoints.sm,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
              child: Column(
                children: [
                  Gaps.v80,
                  Text(
                    S.of(context).signUpTitle('TikTok'),
                    // S.of(context).signUpTitleWithDateTime('TikTok', DateTime.now()),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Gaps.v20,
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      S.of(context).signUpSubtitle(3),
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                        // color: isDarkMode(context)
                        //     ? Colors.grey.shade400
                        //     : Colors.black45,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v40,
                  AuthButtonsByOrientation(
                    orientation: orientation,
                    isNewUser: true,
                    onTapEmailAndPassword: _onTapEmailAndPassword,
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color:
              isDarkMode(context) ? Colors.grey.shade900 : Colors.grey.shade50,
          height: 130,
          child: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size32,
              bottom: Sizes.size64,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).alreadyHaveAnAccount,
                  style: const TextStyle(
                    fontSize: Sizes.size18,
                  ),
                ),
                Gaps.h5,
                GestureDetector(
                  onTap: () => _onTapLogin(context),
                  child: Text(
                    S.of(context).logIn('female'),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
