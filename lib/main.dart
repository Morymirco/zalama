import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'screens/web/contact_page.dart';
import 'screens/web/landing_page.dart';
import 'screens/web/legal_page.dart';
import 'screens/web/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zalama',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF1E88E5),  // Couleur bleue du logo
          secondary: Colors.white,
          surface: Color(0xFF1C1C1E),  // Couleur de fond sombre
          background: Color(0xFF1C1C1E),
        ),
        scaffoldBackgroundColor: Color(0xFF1C1C1E),
        cardColor: Color(0xFF2C2C2E),  // Couleur des cartes
        useMaterial3: true,
      ),
      home: kIsWeb ? const WebAppLoader() : const SplashScreen(),
      routes: {
        '/terms': (context) => const LegalPage(
              title: 'Conditions d\'utilisation',
              content: 'Contenu des conditions d\'utilisation...',
            ),
        '/privacy': (context) => const LegalPage(
              title: 'Politique de confidentialité',
              content: 'Contenu de la politique de confidentialité...',
            ),
        '/legal': (context) => const LegalPage(
              title: 'Mentions légales',
              content: 'Contenu des mentions légales...',
            ),
        '/cgu': (context) => const LegalPage(
              title: 'CGU',
              content: 'Contenu des CGU...',
            ),
        '/faq': (context) => const LegalPage(
              title: 'FAQ',
              content: 'Contenu de la FAQ...',
            ),
        '/help': (context) => const LegalPage(
              title: 'Centre d\'aide',
              content: 'Contenu du centre d\'aide...',
            ),
        '/blog': (context) => const LegalPage(
              title: 'Blog',
              content: 'Contenu du blog...',
            ),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}

class WebAppLoader extends StatefulWidget {
  const WebAppLoader({super.key});

  @override
  State<WebAppLoader> createState() => _WebAppLoaderState();
}

class _WebAppLoaderState extends State<WebAppLoader> {
  @override
  void initState() {
    super.initState();
    _loadApp();
  }

  Future<void> _loadApp() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LandingPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
  }
}
