import 'package:flutter/material.dart';

class QrisScreen extends StatelessWidget {
  const QrisScreen({super.key});

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
              'QRIS Screen',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 24, 
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3E9DC),
        title: const Text('QRIS'),
      ),
    );
  }
}