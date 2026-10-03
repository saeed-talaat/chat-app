import 'package:chat_app/core/constants/app_constatns.dart';
import 'package:chat_app/core/routes/app_routes.dart';
import 'package:chat_app/core/services/sharedpreferences_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/features/splash/presentation/views/widgets/splash_logo_placeholder.dart';
import 'package:chat_app/features/splash/presentation/views/widgets/splash_app_title.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    _executeNavigation();
    super.initState();
  }

  Future<void> _executeNavigation() async {
    final isOnBoardingSeen = Prefs.getBool(AppConstatns.isOnboardingSeen);
    final isLoggedin = Prefs.getBool(AppConstatns.isLoggedIn);

    await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;

    if (isLoggedin) {
      context.go(AppRoutes.homeView);
    } else {
      if (isOnBoardingSeen) {
        context.go(AppRoutes.enterPhoneView);
      } else {
        context.go(AppRoutes.onboardingView);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SplashLogoPlaceholder(),
          SizedBox(height: 24),
          SplashAppTitle(),
        ],
      ),
    );
  }
}
