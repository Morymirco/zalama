import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zalama/constants/colors.dart';
import 'package:zalama/screens/otp_verification_screen.dart';

class ProfessionalInfoScreen extends StatefulWidget {
  const ProfessionalInfoScreen({super.key});

  @override
  State<ProfessionalInfoScreen> createState() => _ProfessionalInfoScreenState();
}

class _ProfessionalInfoScreenState extends State<ProfessionalInfoScreen> {
  String? _selectedFile;
  bool _acceptConditions = false;

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
                    'Vos informations professionnelles',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Status
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.greyLight),
                      ),
                    ),
                    items: ['Salarié', 'Entrepreneur', 'Fonctionnaire']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                  const SizedBox(height: 16),
                  // Activité ou profession
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Activité ou profession',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.greyLight),
                      ),
                    ),
                    items: ['Médecin', 'Enseignant', 'Ingénieur', 'Autre']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                  const SizedBox(height: 16),
                  // Montant minimum
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Montant minimum pouvant être prêter',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.greyLight),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  // Section pièce d'identité
                  const Text(
                    'Importez ou prenez en photo votre:',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                  ),
                  const Text(
                    '• Pièce d\'identité (carte d\'identité ou passeport)',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                  ),
                  const Text(
                    'NB: Si vous êtes un groupement ou une entreprise mettez juste\nles pièces du gérant.',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Zone d'upload
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Logique pour importer un fichier
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primary,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.upload_file,
                                  color: AppColors.primary,
                                  size: 32,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Importer votre fichier',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Logique pour prendre une photo
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primary,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  color: AppColors.primary,
                                  size: 32,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Prendre une photo',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_selectedFile != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.greyLight.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.insert_drive_file),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(_selectedFile!),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedFile = null;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 32),
                  // Checkbox pour les conditions d'utilisation
                  Row(
                    children: [
                      Checkbox(
                        value: _acceptConditions,
                        onChanged: (value) {
                          setState(() {
                            _acceptConditions = value ?? false;
                          });
                        },
                        activeColor: AppColors.primary,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.grey,
                            ),
                            children: [
                              const TextSpan(
                                text: 'J\'accepte les ',
                              ),
                              TextSpan(
                                text: 'conditions d\'utilisation',
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Ouvrir les conditions d'utilisation
                                  },
                              ),
                              const TextSpan(
                                text: ' et la ',
                              ),
                              TextSpan(
                                text: 'politique de confidentialité',
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Ouvrir la politique de confidentialité
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Bouton Continuer
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _acceptConditions 
                          ? () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => 
                                    const OtpVerificationScreen(),
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
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
                      ),
                      child: const Text(
                        'Continuer',
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
} 