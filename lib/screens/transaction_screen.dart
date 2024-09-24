import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'history_transaction_screen.dart';
import 'transfer_screen.dart';
import 'payment_screen.dart';
import 'loan_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final List<bool> _isHovered = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF301F17),
        title: const Center(
          child: Text(
            'Transactions',
            style: TextStyle(
              color: Color(0xFFF3E9DC),
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFeatureCard(
                      context,
                      icon: CupertinoIcons.clock,
                      title: 'History\nTransaction',
                      page: const HistoryTransactionScreen(),
                      index: 0,
                    ),
                    _buildFeatureCard(
                      context,
                      icon: CupertinoIcons.arrow_right,
                      title: 'Transfer',
                      page: const TransferScreen(),
                      index: 1,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFeatureCard(
                      context,
                      icon: CupertinoIcons.creditcard,
                      title: 'Payment',
                      page: const PaymentScreen(),
                      index: 2,
                    ),
                    _buildFeatureCard(
                      context,
                      icon: CupertinoIcons.money_dollar,
                      title: 'Loan',
                      page: const LoanScreen(),
                      index: 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, {required IconData icon, required String title, required Widget page, required int index}) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered[index] = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered[index] = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Container(
          width: 150,
          height: 120,
          decoration: BoxDecoration(
            color: _isHovered[index] ? Colors.brown[300] : Colors.brown[200],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 36,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}