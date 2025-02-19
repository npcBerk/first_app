import 'package:first_app/main.dart';
import 'package:first_app/states/navbar.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavbarWidget extends ConsumerStatefulWidget {
  const NavbarWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends ConsumerState<NavbarWidget> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = ref.watch(navbarProvider).selectedIndex;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          MyHomePage(title: 'Welcome to Home Page'),
          PostSearchBar(),
          WidgetTestMenu(),
          SettingsMenu(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (index) => ref.read(navbarProvider).setSelectedIndex(index),
        backgroundColor: Colors.red,
        fixedColor: Colors.blue,
        unselectedIconTheme: IconThemeData(color: Colors.green),
        unselectedItemColor: Colors.red,
        unselectedLabelStyle: TextStyle(color: Colors.green),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Widget Test'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}