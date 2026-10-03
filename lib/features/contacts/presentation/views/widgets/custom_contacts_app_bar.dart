import 'package:chat_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomContactsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomContactsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 24,
      title: const Text(
        'Contacts',
        style: TextStyle(
          color: Color(0xFF1A1F2C),
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
           context.push(AppRoutes.addContactView);
          },
          icon: const Icon(Icons.add, color: Color(0xFF1A1F2C), size: 24),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

