import 'package:flutter/material.dart';
import './screens/registration_page.dart';
import './screens/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Salem Group',
      home: MyHomePage(
        title: 'Salem Group',

      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.blueGrey,
          elevation: 5,
          height: 60,

          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          animationDuration: const Duration(seconds: 1),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.dashboard,
                color: Colors.white,

              ),
              tooltip: 'Navigate to Dashboard',
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.login,
                color: Colors.white,
              ),
              label: 'Register',
            ),
          ],
        ),
        body: [
          const DashboardPage(),
          const RegistrationPage(),
        ][currentPageIndex],
      ),
    );
  }
}
