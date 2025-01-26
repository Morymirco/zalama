import 'package:flutter/material.dart';

import 'bonus_screen.dart';
import 'notification_screen.dart';
import 'partners_screen.dart';
import 'security_screen.dart';
import 'support_screen.dart';
import 'tarifs_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkMode = true;

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 24, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF64748B),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? trailing,
    bool showArrow = true,
    VoidCallback? onTap,
    Widget? trailingWidget,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: const Color(0xFF2F7AC8),
            size: 20,
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          trailing: trailingWidget ??
              (showArrow
                  ? const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF64748B),
                      size: 16,
                    )
                  : Text(
                      trailing ?? '',
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 14,
                      ),
                    )),
          onTap: onTap,
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            indent: 56,
            endIndent: 16,
            color: Color(0xFF2F2F2F),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: ListView(
          children: [
            // Section Privée
            _buildSectionTitle('Privée'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF242426),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'Profile',
                    showDivider: true,
                  ),
                  _buildMenuItem(
                    icon: Icons.security,
                    title: 'Sécurités',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SecurityScreen()),
                      );
                    },
                    showDivider: false,
                  ),
                ],
              ),
            ),

            // Section Finance
            _buildSectionTitle('Finance'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF242426),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.receipt_long,
                    title: 'Nos tarifs',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TarifsScreen()),
                      );
                    },
                    showDivider: true,
                  ),
                  _buildMenuItem(
                    icon: Icons.handshake,
                    title: 'Nos partenaires',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PartnersScreen()),
                      );
                    },
                    showDivider: false,
                  ),
                ],
              ),
            ),

            // Section Compte
            _buildSectionTitle('Compte'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF242426),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.palette_outlined,
                    title: 'Thèmes',
                    showArrow: false,
                    trailingWidget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Dark mode',
                          style: TextStyle(
                            color: Color(0xFF2F7AC8),
                            fontSize: 14,
                          ),
                        ),
                        Switch(
                          value: _isDarkMode,
                          onChanged: (value) {
                            setState(() {
                              _isDarkMode = value;
                            });
                          },
                          activeColor: const Color(0xFF2F7AC8),
                        ),
                      ],
                    ),
                    showDivider: true,
                  ),
                  _buildMenuItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                    showDivider: false,
                  ),
                ],
              ),
            ),

            // Section Plus
            _buildSectionTitle('Plus'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF242426),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.card_giftcard,
                    title: 'Mes bonus',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BonusScreen()),
                      );
                    },
                    showDivider: true,
                  ),
                  _buildMenuItem(
                    icon: Icons.share,
                    title: 'Envoyez à vos amis !',
                    showDivider: true,
                  ),
                  _buildMenuItem(
                    icon: Icons.help_outline,
                    title: 'Supports',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SupportScreen()),
                      );
                    },
                    showDivider: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 