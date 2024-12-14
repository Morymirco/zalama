import 'package:flutter/material.dart';
import 'package:zalama/constants/colors.dart';
import 'package:zalama/screens/success_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String _password = '';
  double _passwordStrength = 0;
  Color _strengthColor = Colors.grey;

  void _checkPasswordStrength(String password) {
    _password = password;
    _passwordStrength = 0;
    
    if (password.isEmpty) {
      _strengthColor = AppColors.greyLight;
      _passwordStrength = 0;
    } else {
      if (password.length >= 8) _passwordStrength += 0.25;
      if (password.contains(RegExp(r'[A-Z]'))) _passwordStrength += 0.25;
      if (password.contains(RegExp(r'[0-9]'))) _passwordStrength += 0.25;
      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) _passwordStrength += 0.25;

      // Définir la couleur en fonction de la force
      if (_passwordStrength <= 0.25) {
        _strengthColor = Colors.red;
      } else if (_passwordStrength <= 0.5) {
        _strengthColor = Colors.orange;
      } else if (_passwordStrength <= 0.75) {
        _strengthColor = Colors.yellow;
      } else {
        _strengthColor = Colors.green;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Motifs décoratifs
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/motifZ.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
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
              ),
            ),
          ),
          // Contenu principal
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bouton retour
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      ),
                      onPressed: () => Navigator.pop(context),
                      padding: const EdgeInsets.only(left: 8),
                      constraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Ajouter un mot passe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Le mot de passe que vous allez entrer\nsera celui de votre compte zalama.',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Champ mot de passe
                  const Text(
                    'Mot de passe',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    obscureText: _obscurePassword,
                    onChanged: _checkPasswordStrength,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.greyLight),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Indicateur de force du mot de passe
                  Container(
                    width: double.infinity,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: MediaQuery.of(context).size.width * 0.87 * _passwordStrength,
                          decoration: BoxDecoration(
                            color: _strengthColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getPasswordStrengthText(),
                    style: TextStyle(
                      fontSize: 12,
                      color: _strengthColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Champ confirmation mot de passe
                  const Text(
                    'Confirmation du mot de passe',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.greyLight),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Bouton S'inscrire
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => 
                              const SuccessScreen(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              var tween = Tween(begin: begin, end: end);
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                            transitionDuration: const Duration(milliseconds: 300),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'S\'inscrire',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  String _getPasswordStrengthText() {
    if (_password.isEmpty) return '';
    if (_passwordStrength <= 0.25) return 'Mot de passe très faible';
    if (_passwordStrength <= 0.5) return 'Mot de passe faible';
    if (_passwordStrength <= 0.75) return 'Mot de passe moyen';
    return 'Mot de passe fort';
  }
} 