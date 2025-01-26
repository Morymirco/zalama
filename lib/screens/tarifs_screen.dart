import 'package:flutter/material.dart';

class TarifsScreen extends StatelessWidget {
  const TarifsScreen({super.key});

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
          "Nos tarifs",
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
          _buildTarifCard(
            title: 'Avance sur salaire',
            description: 'Frais de service pour les avances sur salaire',
            items: [
              TarifItem(
                label: 'Montant < 500.000 GNF',
                value: '2%',
              ),
              TarifItem(
                label: 'Montant > 500.000 GNF',
                value: '3%',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTarifCard(
            title: 'Transfert d\'argent',
            description: 'Frais de transfert selon le montant',
            items: [
              TarifItem(
                label: 'Entre utilisateurs Zalama',
                value: 'Gratuit',
                isHighlighted: true,
              ),
              TarifItem(
                label: 'Vers d\'autres comptes',
                value: '1.5%',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTarifCard(
            title: 'Services additionnels',
            description: 'Autres services disponibles',
            items: [
              TarifItem(
                label: 'Consultation de solde',
                value: 'Gratuit',
                isHighlighted: true,
              ),
              TarifItem(
                label: 'Relevé de compte',
                value: '5.000 GNF',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTarifCard({
    required String title,
    required String description,
    required List<TarifItem> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF242426),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFF2F2F2F),
          ),
          ...items.map((item) => _buildTarifItem(item)).toList(),
        ],
      ),
    );
  }

  Widget _buildTarifItem(TarifItem item) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                item.value,
                style: TextStyle(
                  color: item.isHighlighted
                      ? const Color(0xFF2F7AC8)
                      : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (item.showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFF2F2F2F),
          ),
      ],
    );
  }
}

class TarifItem {
  final String label;
  final String value;
  final bool isHighlighted;
  final bool showDivider;

  TarifItem({
    required this.label,
    required this.value,
    this.isHighlighted = false,
    this.showDivider = true,
  });
} 