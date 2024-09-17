import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get started'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman sign up'),
      ),
    );
  }
}
