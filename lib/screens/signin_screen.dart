import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome back'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman sign in'),
      ),
    );
  }
}
