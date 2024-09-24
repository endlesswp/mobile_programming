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

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool _isBalanceVisible = false;

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
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Color(0xFF301f17),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                    child: Center(
                      child: Image.asset(
                        'assets/sarang_wallet2.png',
                        height: 100,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    left: 25,
                    child: Text(
                      'Hello, User',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/card.png',
                    height: 225,
                  ),
                  const Positioned(
                    top: 62,
                    left: 87,
                    child: Text(
                      'Your account balance',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 115,
                    left: 105,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            _isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.brown,
                          ),
                          onPressed: () {
                            setState(() {
                              _isBalanceVisible = !_isBalanceVisible;
                            });
                          },
                        ),
                        Text(
                          _isBalanceVisible ? 'Rp. 123.456.789' : 'Rp. **********',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30), 
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Promo & Discount',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF3E9DC), 
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  children: [
                    Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD7CCC8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD7CCC8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD7CCC8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD7CCC8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD7CCC8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}