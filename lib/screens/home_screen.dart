import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'transaction_screen.dart';
import 'qris_screen.dart';
import 'reminder_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const TransactionScreen(),
    const QrisScreen(),
    const ReminderScreen(),
    const ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0), 
              child: Icon(CupertinoIcons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0), 
              child: Icon(CupertinoIcons.money_dollar),
            ),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0), 
              child: Icon(CupertinoIcons.qrcode),
            ),
            label: 'QRIS',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0), 
              child: Icon(CupertinoIcons.bell),
            ),
            label: 'Reminders',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0), 
              child: Icon(CupertinoIcons.profile_circled),
            ),
            label: 'Profile',
          ),
        ],
        backgroundColor: const Color(0xFF301F17), 
        activeColor: Colors.white, 
        inactiveColor: Colors.grey, 
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) => _pages[index],
        );
      },
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4E342E),
                    Color(0xFF8D6E63),
                    Color(0xFF4E342E),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          const Center(
            child: Text(
              'Home Screen',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 24, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}