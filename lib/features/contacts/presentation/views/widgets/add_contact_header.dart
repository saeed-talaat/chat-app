import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddContactHeader extends StatelessWidget {
  const AddContactHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          color: Colors.black87,
        ),
        const SizedBox(width: 4),
        Text(
          'Add Contact',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        
      ],
    );
  }
}