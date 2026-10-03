import 'package:chat_app/core/utils/app_images/assets.dart';
import 'package:flutter/material.dart';

class AddAvatarWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 101,
          decoration: const BoxDecoration(
            color: Color(0xFFF4F5F9),
            shape: BoxShape.circle,
          ),
          child: Image.asset(Assets.assetsImagesProfileImage),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              // upload image
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
