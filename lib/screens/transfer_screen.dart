import 'package:flutter/material.dart';
import 'package:zalama/constants/colors.dart';
import 'package:zalama/screens/transfer_confirmation_screen.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  String? _selectedPayment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Transfert d\'argent',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Champ montant
            const Text(
              'Entrez un montant',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.greyLight),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
            const SizedBox(height: 24),
            // Mode de paiement
            const Text(
              'Choisir un mode de payement',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            // Grid des options de paiement
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildPaymentOption(
                  icon: 'assets/logoz.png',
                  label: 'ZALAMA',
                  onTap: () => setState(() => _selectedPayment = 'ZALAMA'),
                ),
                _buildPaymentOption(
                  icon: 'assets/icons/money.png',
                  label: 'OM',
                  onTap: () => setState(() => _selectedPayment = 'OM'),
                ),
                _buildPaymentOption(
                  icon: 'assets/icons/momo.png',
                  label: 'MoMo',
                  onTap: () => setState(() => _selectedPayment = 'MoMo'),
                ),
                _buildPaymentOption(
                  icon: 'assets/icons/visa.png',
                  label: 'Visa',
                  onTap: () => setState(() => _selectedPayment = 'Visa'),
                ),
                _buildPaymentOption(
                  icon: 'assets/icons/uba.png',
                  label: 'UBA',
                  onTap: () => setState(() => _selectedPayment = 'UBA'),
                ),
                _buildPaymentOption(
                  icon: 'assets/icons/banque.png',
                  label: 'Banques',
                  onTap: () => setState(() => _selectedPayment = 'Banques'),
                ),
                _buildPaymentOption(
                  icon: 'assets/icons/paycard.png',
                  label: 'Paycard',
                  onTap: () => setState(() => _selectedPayment = 'Paycard'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_selectedPayment != null) ...[
              // Champ numéro de téléphone
              const Text(
                'Entrez le numéro de téléphone',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Numéro de téléphone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.greyLight),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.contacts),
                    onPressed: () {
                      // Logique pour sélectionner depuis les contacts
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Bouton Valider
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransferConfirmationScreen(
                          amount: '400.000', // Récupérer la vraie valeur
                          phone: '622 51 67 25', // Récupérer le vrai numéro
                          method: _selectedPayment ?? '',
                        ),
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
                    'Valider',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final bool isSelected = _selectedPayment == label;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.greyLight,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 40,
              height: 40,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColors.primary : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
} 