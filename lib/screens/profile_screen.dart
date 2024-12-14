import 'package:flutter/material.dart';
import 'package:zalama/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Privacy',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              _buildListItem(
                icon: Icons.person_outline,
                title: 'Profile',
                showArrow: true,
                onTap: () {},
              ),
              _buildListItem(
                icon: Icons.security_outlined,
                title: 'Security',
                showArrow: true,
                onTap: () {},
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Finance',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              _buildListItem(
                icon: Icons.history,
                title: 'History',
                showArrow: true,
                onTap: () {},
              ),
              _buildListItem(
                icon: Icons.speed_outlined,
                title: 'Limits',
                showArrow: true,
                onTap: () {},
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Account',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              _buildListItem(
                icon: Icons.palette_outlined,
                title: 'Theme',
                showSwitch: true,
                switchValue: false,
                onSwitchChanged: (value) {},
                subtitle: 'Dark mode',
              ),
              _buildListItem(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                showArrow: true,
                onTap: () {},
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'More',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              _buildListItem(
                icon: Icons.card_giftcard_outlined,
                title: 'My bonus',
                showArrow: true,
                onTap: () {},
              ),
              _buildListItem(
                icon: Icons.share_outlined,
                title: 'Share with friends',
                showArrow: true,
                onTap: () {},
              ),
              _buildListItem(
                icon: Icons.support_outlined,
                title: 'Support',
                showArrow: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required String title,
    bool showArrow = false,
    bool showSwitch = false,
    bool switchValue = false,
    String? subtitle,
    VoidCallback? onTap,
    Function(bool)? onSwitchChanged,
  }) {
    return InkWell(
      onTap: showSwitch ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
            if (showSwitch)
              Switch(
                value: switchValue,
                onChanged: onSwitchChanged,
                activeColor: AppColors.primary,
              )
            else if (showArrow)
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
} 