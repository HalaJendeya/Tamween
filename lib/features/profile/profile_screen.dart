import 'package:flutter/material.dart';

import '../../app/app_colors.dart';
import '../../app/app_strings.dart';
import '../../app/tamween_app.dart';
import '../../widgets/primary_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF55CEC4), AppColors.surface],
          stops: [.0, .32],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.ink,
                  child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.notifications, color: Colors.white, size: 20),
                  ),
                ),
                const Spacer(),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(AppStrings.profileEmail, style: TextStyle(color: Colors.white, fontSize: 16)),
                    Text(AppStrings.profileName, style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 28),
            const _ProfileCard(
              children: [
                _ProfileTile(
                  icon: Icons.person,
                  title: AppStrings.accountData,
                  subtitle: AppStrings.editAccountData,
                ),
                _ProfileTile(
                  icon: Icons.lock,
                  title: AppStrings.changePassword,
                  subtitle: AppStrings.createNewPassword,
                ),
                _ProfileTile(
                  icon: Icons.language,
                  title: AppStrings.appLanguage,
                  subtitle: AppStrings.appLanguageSubtitle,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const _ProfileCard(
              children: [
                _ProfileTile(
                  icon: Icons.storefront,
                  title: AppStrings.registerAsMerchant,
                  subtitle: AppStrings.createYourStore,
                ),
              ],
            ),
            const SizedBox(height: 10),
            _ProfileCard(
              children: [
                SwitchListTile(
                  value: _notificationsEnabled,
                  activeThumbColor: AppColors.primary,
                  onChanged: (value) => setState(() => _notificationsEnabled = value),
                  secondary: const Icon(Icons.notifications, color: AppColors.muted),
                  title: const Text(AppStrings.receiveNotifications),
                  subtitle: const Text(
                    AppStrings.receiveNotificationsSubtitle,
                    style: TextStyle(color: AppColors.muted),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const _ProfileCard(
              children: [
                _ProfileTile(icon: Icons.person, title: AppStrings.contactUs, subtitle: AppStrings.contactUsSubtitle),
                _ProfileTile(icon: Icons.help, title: AppStrings.faq),
                _ProfileTile(icon: Icons.info, title: AppStrings.aboutApp),
                _ProfileTile(icon: Icons.verified_user, title: AppStrings.termsAndConditions),
              ],
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              label: AppStrings.logout,
              icon: Icons.power_settings_new,
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login, (_) => false),
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Column(children: children),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({required this.icon, required this.title, this.subtitle});

  final IconData icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.muted, size: 20),
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!, style: const TextStyle(color: AppColors.muted, fontSize: 12)),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.chevron_right, size: 20),
      ),
      onTap: () {},
    );
  }
}
