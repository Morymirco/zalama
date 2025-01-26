import 'package:flutter/material.dart';

class PartnersScreen extends StatelessWidget {
  const PartnersScreen({super.key});

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
          "Nos partenaires",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPartnerSection(
            title: 'Services financiers',
            partners: [
              PartnerItem(
                logo: 'assets/icons/orange_money.png',
                name: 'Orange Money',
                description: 'Transfert d\'argent mobile',
              ),
              PartnerItem(
                logo: 'assets/icons/mtn.png',
                name: 'MTN Mobile Money',
                description: 'Solutions de paiement mobile',
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildPartnerSection(
            title: 'Banques partenaires',
            partners: [
              PartnerItem(
                logo: 'assets/icons/bank1.png',
                name: 'Ecobank',
                description: 'Services bancaires',
              ),
              PartnerItem(
                logo: 'assets/icons/bank2.png',
                name: 'UBA',
                description: 'Solutions bancaires',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPartnerSection({
    required String title,
    required List<PartnerItem> partners,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF64748B),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF242426),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: partners.asMap().entries.map((entry) {
              final isLast = entry.key == partners.length - 1;
              return _buildPartnerItem(entry.value, !isLast);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildPartnerItem(PartnerItem partner, bool showDivider) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 48,
            height: 48,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              partner.logo,
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            partner.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            partner.description,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 14,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF64748B),
            size: 16,
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            indent: 72,
            endIndent: 16,
            color: Color(0xFF2F2F2F),
          ),
      ],
    );
  }
}

class PartnerItem {
  final String logo;
  final String name;
  final String description;

  PartnerItem({
    required this.logo,
    required this.name,
    required this.description,
  });
}