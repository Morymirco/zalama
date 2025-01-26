import 'package:flutter/material.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool _biometricEnabled = true;
  bool _smsAuthEnabled = true;

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
          "Sécurité",
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
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF242426),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _buildSecurityItem(
                  icon: Icons.lock_outline,
                  title: 'Changer le mot de passe',
                  showDivider: true,
                  onTap: () {
                    // Navigation vers changement de mot de passe
                  },
                ),
                _buildSecurityItem(
                  icon: Icons.fingerprint,
                  title: 'Authentification biométrique',
                  showDivider: true,
                  trailing: Switch(
                    value: _biometricEnabled,
                    onChanged: (value) {
                      setState(() {
                        _biometricEnabled = value;
                      });
                    },
                    activeColor: const Color(0xFF2F7AC8),
                  ),
                ),
                _buildSecurityItem(
                  icon: Icons.message_outlined,
                  title: 'Authentification par SMS',
                  showDivider: true,
                  trailing: Switch(
                    value: _smsAuthEnabled,
                    onChanged: (value) {
                      setState(() {
                        _smsAuthEnabled = value;
                      });
                    },
                    activeColor: const Color(0xFF2F7AC8),
                  ),
                ),
                _buildSecurityItem(
                  icon: Icons.devices_outlined,
                  title: 'Appareils connectés',
                  showDivider: false,
                  onTap: () {
                    // Navigation vers appareils connectés
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityItem({
    required IconData icon,
    required String title,
    required bool showDivider,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: const Color(0xFF2F7AC8),
            size: 24,
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          trailing: trailing ?? 
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF64748B),
                size: 16,
              ),
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
}