import 'package:flutter/material.dart';

import 'change_pin_screen.dart';
import 'help_support_screen.dart';
import 'onboarding_screen.dart'; // Add this import

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              const SizedBox(height: 40),
              // ... (rest of the UI remains the same)
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF301F17),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      FeatureCard(
                        icon: Icons.lock,
                        title: 'Change PIN',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ChangePinScreen()),
                          );
                        },
                      ),
                      FeatureCard(
                        icon: Icons.help,
                        title: 'Help & Support',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HelpSupportScreen()),
                          );
                        },
                      ),
                      FeatureCard(
                        icon: Icons.logout,
                        title: 'Logout',
                        onTap: () {
                          // Show a confirmation dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Logout'),
                                content: const Text('Are you sure you want to logout?'),
                                actions: [
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Logout'),
                                    onPressed: () {
                                      // Close the dialog
                                      Navigator.of(context).pop();
                                      // Navigate to the OnboardingScreen
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// The FeatureCard class remains the same

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const FeatureCard({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.brown[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}