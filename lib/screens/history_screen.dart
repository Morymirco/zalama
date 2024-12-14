import 'package:flutter/material.dart';
import 'package:zalama/constants/colors.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String _selectedFilter = 'Tout';
  final List<String> _filterOptions = ['Tout', 'Approuve', 'Non approuve', 'En attente'];

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _filterOptions.map((option) {
            return ListTile(
              title: Text(
                option,
                style: TextStyle(
                  color: _selectedFilter == option ? AppColors.primary : Colors.black,
                  fontWeight: _selectedFilter == option ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              leading: _selectedFilter == option 
                  ? const Icon(Icons.check, color: AppColors.primary)
                  : const SizedBox(width: 24),
              onTap: () {
                setState(() {
                  _selectedFilter = option;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // En-tête avec menu déroulant
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _showFilterOptions(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyLight),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _selectedFilter,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Liste des transactions
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildTransactionItem(
                    icon: 'assets/icons/money.png',
                    title: 'Orange Money',
                    date: 'Aujourd\'hui, 16:50',
                    amount: '-500.000 GNF',
                    status: 'Approuve',
                    statusColor: Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildTransactionItem(
                    icon: 'assets/icons/visa.png',
                    title: 'visa',
                    date: 'Aujourd\'hui, 16:50',
                    amount: '-500.000 GNF',
                    status: 'Non approuve',
                    statusColor: Colors.red,
                  ),
                  const SizedBox(height: 12),
                  _buildTransactionItem(
                    icon: 'assets/icons/paycard.png',
                    title: 'Paypal',
                    date: 'Aujourd\'hui, 16:50',
                    amount: '-500.000 GNF',
                    status: 'En attente',
                    statusColor: Colors.orange,
                  ),
                  // Répéter pour plus de transactions...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required String icon,
    required String title,
    required String date,
    required String amount,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyLight),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              icon,
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: AppColors.grey.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 