import 'package:flutter/material.dart';
import 'package:zalama/constants/colors.dart';
import 'package:zalama/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool _showPatterns = false;
  bool _showAppName = false;

  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
    // Animation séquentielle
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _showPatterns = true;
      });
    });
    // Afficher le nom de l'app vers la fin
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        _showAppName = true;
      });
    });
  }

  _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const OnboardingScreen(),
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
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Motif en haut à droite
          Positioned(
            top: 0,
            right: 0,
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
          // Motif en bas à gauche
          Positioned(
            bottom: 0,
            left: 0,
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
          // Logo central
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 800),
                  opacity: _showPatterns ? 1.0 : 0.0,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/logoW.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Nom de l'application en bas
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _showAppName ? 1.0 : 0.0,
              child: const Column(
                children: [
                  Text(
                    'ZALAMA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Votre partenaire financier',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 