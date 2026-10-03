import 'package:chat_app/core/constants/app_constatns.dart';
import 'package:chat_app/core/routes/app_routes.dart';
import 'package:chat_app/core/services/sharedpreferences_service.dart';
import 'package:chat_app/core/utils/app_images/assets.dart';
import 'package:chat_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
          Image.asset(Assets.assetsImagesOnboardingImage),
          SizedBox(height: 42),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              'Connect easily with your family and friends over countries',
              style: TextStyle(
                color: Color(0xff0F1828),
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Spacer(),
          Text(
            'Terms & Privacy Policy',
            style: TextStyle(color: Color(0xff0F1828), fontSize: 14),
          ),
          SizedBox(height: 18),
          CustomButton(
            onPressed: () {
              Prefs.setBool(AppConstatns.isOnboardingSeen, true);
              context.go(AppRoutes.enterPhoneView);
            },
            text: 'Start Messaging',
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
