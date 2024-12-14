import 'package:flutter/material.dart';
import 'package:zalama/models/onboarding_data.dart';
import 'package:zalama/screens/auth_screen.dart';
import 'package:zalama/widgets/dot_indicator.dart';
import 'package:zalama/widgets/onboarding_page.dart';
import 'package:zalama/widgets/circle_progress_painter.dart';
import 'package:zalama/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      image: 'assets/onboarding_finance.png',
      title: 'Une solution financière innovante',
      description: 'Accédez rapidement et en toute sécurité à vos ressources pour répondre à vos besoins immédiats.',
    ),
    OnboardingData(
      image: 'assets/services.png',
      title: 'Services flexibles',
      description: 'Acompte sur salaire, salaire à la demande, pensions, avances mensuelles et primes anticipées.',
    ),
    OnboardingData(
      image: 'assets/conseil.png',
      title: 'Conseil personnalisés',
      description: 'Améliorez la gestion de votre budget et planifieé sereinement votre avenir financier.',
    ),
    OnboardingData(
      image: 'assets/pret.png',
      title: 'Prêt P2P accessibles',
      description: 'Des prêts directs entre utilisateurs, à moindre coût pour les emprunteurs et rentables pour les prêteurs.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/motifZ.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
              // color: const Color(0xFF1565C0).withOpacity(0.1),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Transform.rotate(
              angle: 3.14159,
              child: Image.asset(
                'assets/motifZ.png',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
                // color: const Color(0xFF1565C0).withOpacity(0.1),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return OnboardingPage(data: _pages[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigation directe vers la page de login
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
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
                        },
                        child: Text(
                          _currentPage == _pages.length - 1 ? '' : 'Passer',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: CustomPaint(
                              painter: CircleProgressPainter(
                                progress: (_currentPage + 1) / _pages.length,
                                color: const Color(0xFF0E2C66),
                              ),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF0E2C66),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                _currentPage == _pages.length - 1
                                    ? Icons.check
                                    : Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                if (_currentPage == _pages.length - 1) {
                                  // Navigation vers la page de login à la fin de l'onboarding
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => const AuthScreen(),
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
                                } else {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 