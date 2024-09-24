import 'package:flutter/material.dart';

class HistoryTransactionScreen extends StatelessWidget {
  const HistoryTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Transaction'),
      ),
      body: const Center(child: Text('History Transaction Screen')),
    );
  }
}