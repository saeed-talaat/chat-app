import 'package:flutter/material.dart';

class SearchResultItem extends StatelessWidget {
  final String name;

  const SearchResultItem({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey[200]!), 
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24.0,
            backgroundColor: Colors.grey[100],
            child: Icon(
              Icons.person,
              color: Colors.grey[400],
              size: 28.0,
            ),
          ),
          const SizedBox(width: 16.0),

          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1F2C),
              ),
            ),
          ),

          TextButton(
            onPressed: () {
              // add
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.green.withValues(alpha: .1), 
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), 
              ),
            ),
            child: const Text(
              'Add',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}