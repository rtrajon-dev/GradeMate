import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';
import '../providers/theme_provider.dart';
import 'add_subject_screen.dart';
import 'subject_list_screen.dart';
import 'summary_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _screens = [
    AddSubjectScreen(),
    SubjectListScreen(),
    SummaryScreen(),
  ];

  static const _titles = ['Add Subject', 'Subjects', 'Summary'];

  @override
  Widget build(BuildContext context) {
    final navigation = context.watch<NavigationProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final currentIndex = navigation.selectedIndex;

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[currentIndex]),
        actions: [
          IconButton(
            icon: Icon(themeProvider.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          ),
        ],
      ),
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => context.read<NavigationProvider>().setIndex(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Subjects'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Summary'),
        ],
      ),
    );
  }
}
