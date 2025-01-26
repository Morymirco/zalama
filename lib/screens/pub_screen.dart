import 'package:flutter/material.dart';

class PubScreen extends StatefulWidget {
  const PubScreen({super.key});

  @override
  State<PubScreen> createState() => _PubScreenState();
}

class _PubScreenState extends State<PubScreen> with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;
  final int _storyDuration = 5; // Durée en secondes

  @override
  void initState() {
    super.initState();
    
    // Initialisation du contrôleur d'animation
    _progressController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _storyDuration),
    );

    // Création de l'animation
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_progressController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pop(); // Retour automatique à la fin
        }
      });

    // Démarrage de l'animation
    _progressController.forward();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),  // Mise à jour de la couleur de fond
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onLongPressStart: (_) => _progressController.stop(),
              onLongPressEnd: (_) => _progressController.forward(),
              onTapDown: (_) => _progressController.stop(),
              onTapUp: (_) => _progressController.forward(),
              onTapCancel: () => _progressController.forward(),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: _progressAnimation.value,
                        backgroundColor: const Color(0xFF242426),  // Mise à jour de la couleur
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2F7AC8)),  // Couleur bleue
                        minHeight: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text(
                          'Publicité',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.share, color: Color(0xFF64748B)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/pub3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 16,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF242426),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Color(0xFF64748B),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2F7AC8),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'Acheter',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 48,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF242426),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Jours restant: 3',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour mettre en pause/reprendre l'animation
  void _toggleAnimation() {
    if (_progressController.isAnimating) {
      _progressController.stop();
    } else {
      _progressController.forward();
    }
  }
} 