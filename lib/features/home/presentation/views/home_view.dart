import 'package:chat_app/features/contacts/presentation/views/contacts_view.dart';
import 'package:chat_app/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 1;

  final List<Widget> _views = [
    const ContactsView(),
    const Center(child: Text('Chats View')),
    const Center(child: Text('More View')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: IndexedStack(
        index: _currentIndex,
        children: _views,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


































