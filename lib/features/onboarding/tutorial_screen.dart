import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/common/widgets/navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/widgets/tutorial_page.dart';
import 'package:tiktok_clone/utils/navigator_redirection.dart';
import 'package:tiktok_clone/utils/theme_mode.dart';

enum Direction { right, left }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  bool _isFirstPage = true;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      if (details.delta.dx > 0) {
        // to the right
        _direction = Direction.right;
      } else {
        // to the left
        _direction = Direction.left;
      }
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _isFirstPage = _direction == Direction.right;
    });
  }

  void _onTapEnterTheApp() {
    goToRouteWithoutStack(
      context: context,
      location: MainNavigationScreen.homeRouteURL,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
            child: AnimatedCrossFade(
              crossFadeState: _isFirstPage
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
              firstChild: const TutorialPage(
                title: 'Watch cool videos!',
                content:
                    'Videos are personalized for you based on what you watch, like, and share.',
              ),
              secondChild: const TutorialPage(
                title: 'Follow the rules!',
                content: 'Take care of one another, please:)',
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: isDarkMode(context) ? Colors.black : Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size32,
              bottom: Sizes.size64,
              left: Sizes.size24,
              right: Sizes.size24,
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isFirstPage ? 0 : 1,
              child: CupertinoButton(
                onPressed: _onTapEnterTheApp,
                color: Theme.of(context).primaryColor,
                child: const Text(
                  'Enter the App',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
