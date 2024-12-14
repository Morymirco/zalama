import 'package:flutter/material.dart';
import 'package:zalama/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool _showPatterns = false;

  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
    // Déclencher l'animation après un court délai
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _showPatterns = true;
      });
    });
  }

  _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>  OnboardingScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          var fadeAnimation = Tween(begin: begin, end: end).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          );
          return FadeTransition(
            opacity: fadeAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E2C66),
      body: Stack(
        children: [
          // Motif en haut à droite avec animation
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutBack,
            top: _showPatterns ? 0 : -200,
            right: _showPatterns ? 0 : -200,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: _showPatterns ? 1.0 : 0.0,
              child: Image.asset(
                'assets/motifZ.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Motif en bas à gauche avec animation
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutBack,
            bottom: _showPatterns ? 0 : -200,
            left: _showPatterns ? 0 : -200,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: _showPatterns ? 1.0 : 0.0,
              child: Transform.rotate(
                angle: 3.14159,
                child: Image.asset(
                  'assets/motifZ.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Logo central avec animation de fade
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: _showPatterns ? 1.0 : 0.0,
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color(0xFF1565C0),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/logoW.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 