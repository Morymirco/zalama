import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF242426),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: const Color(0xFF64748B).withOpacity(0.2),
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 16,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        leadingWidth: 72,
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Action pour marquer toutes les notifications comme lues
            },
            child: const Text(
              'Tout marquer comme lu',
              style: TextStyle(
                color: Color(0xFF2F7AC8),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDateSection('Aujourd\'hui'),
          _buildNotificationItem(
            icon: Icons.account_balance_wallet,
            title: 'Avance sur salaire approuvée',
            message: 'Votre demande d\'avance de 500.000 GNF a été approuvée.',
            time: 'Il y a 2 heures',
            isUnread: true,
          ),
          _buildNotificationItem(
            icon: Icons.payment,
            title: 'Transfert réussi',
            message: 'Vous avez reçu 200.000 GNF de Mamadou Diallo.',
            time: 'Il y a 5 heures',
            isUnread: true,
          ),
          _buildDateSection('Hier'),
          _buildNotificationItem(
            icon: Icons.security,
            title: 'Connexion détectée',
            message: 'Nouvelle connexion depuis Conakry, Guinée.',
            time: 'Hier, 15:30',
            isUnread: false,
          ),
          _buildNotificationItem(
            icon: Icons.campaign,
            title: 'Nouvelle fonctionnalité',
            message: 'Découvrez notre nouveau service de prêt P2P !',
            time: 'Hier, 10:45',
            isUnread: false,
          ),
          _buildDateSection('Cette semaine'),
          _buildNotificationItem(
            icon: Icons.account_balance,
            title: 'Rappel de remboursement',
            message: 'N\'oubliez pas votre échéance de remboursement prévue pour le 15/04.',
            time: 'Lundi, 09:20',
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildDateSection(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        date,
        style: const TextStyle(
          color: Color(0xFF64748B),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String message,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF242426),
        borderRadius: BorderRadius.circular(12),
        border: isUnread
            ? Border.all(color: const Color(0xFF2F7AC8), width: 1)
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF2F7AC8),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: isUnread ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (isUnread)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF2F7AC8),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
} 