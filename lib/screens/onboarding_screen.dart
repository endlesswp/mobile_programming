import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; 
import 'signin_screen.dart';
import 'signup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          FirstOnboardingPage(pageController: _pageController),
          SecondOnboardingPage(pageController: _pageController),
        ],
      ),
    );
  }
}

class FirstOnboardingPage extends StatelessWidget {
  final PageController pageController;

  const FirstOnboardingPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 330.0),
                  child: Column(
                    children: [
                      Text(
                        'Simplifying your',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: const Color(0xFFC5A787),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        'financial life',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dancingScript(
                          fontSize: 70,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: const Offset(3.0, 3.0), 
                            blurRadius: 10.0, 
                            color: Colors.brown.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        'starts here.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: const Color(0xFFC5A787),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: SizedBox(
                    width: 140, 
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF301F17), 
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: const Text('Explore More'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



class SecondOnboardingPage extends StatelessWidget {
  final PageController pageController;

  const SecondOnboardingPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: const Color(0xFFF3E9DC),
          ),
        ),
        Positioned(
          top: 65,
          left: 15,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.brown, size: 30),
            onPressed: () {
              pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
        ),
        Positioned(
          top: 130,
          left: 20,
          right: 20,
          child: Center(
            child: Image.asset(
              'assets/sarang_wallet_icon.png',
              height: 280,
              width: 280,
            ),
          ),
        ),
        Positioned(
          top: 430, 
          left: 60,
          right: 60,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF63402C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome to',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFF3E9DC),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  // ignore: deprecated_member_use
                  child: TypewriterAnimatedTextKit(
                  text: const ['Sarang Wallet'],
                  textStyle: GoogleFonts.dancingScript(
                    color: const Color(0xFFF3E9DC),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 250),
                    totalRepeatCount: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          left: 20,
          right: 20,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF301F17),
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text('Sign up'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    const Text(
                      'Do you have an account?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF301F17),
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInScreen()),
                        );
                      },
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
