import 'package:flutter/material.dart';

class NavItem {
  final String label;
  final IconData icon;

  NavItem({required this.label, required this.icon});
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final List<NavItem> items = [
    NavItem(label: 'Contacts', icon: Icons.people_outline), 
    NavItem(label: 'Chats', icon: Icons.chat_bubble_outline),
    NavItem(label: 'More', icon: Icons.more_horiz),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final isActive = currentIndex == index;

            return GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                width: 80, 
                height: 50,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: isActive
                      ? Column(
                          key: ValueKey<String>('active_$index'),
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              items[index].label,
                              style: const TextStyle(
                                color: Color(0xFF1A1F2C), // لون داكن مثل الصورة
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: const BoxDecoration(
                                color: Color(0xFF1A1F2C),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        )
                      : Icon(
                          items[index].icon,
                          key: ValueKey<String>('inactive_$index'),
                          color: const Color(0xFF1A1F2C),
                          size: 26,
                        ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}