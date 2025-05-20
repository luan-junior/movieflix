import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Zeta',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'example@gmail.com',
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),
            ],
          ),

          buildSettingsItem(Icons.person, 'Account'),
          buildSettingsItem(Icons.lock, 'Privacy'),
          buildSettingsItem(Icons.play_circle_filled, 'Appearance'),
          buildSettingsItem(Icons.notifications, 'Notifications'),
          buildSettingsItem(Icons.storage, 'Storage'),
          buildSettingsItem(Icons.accessibility_new, 'Accessibility'),
          buildSettingsItem(Icons.help_outline, 'Help'),
        ],
      ),
    );
  }

  Widget buildSettingsItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      onTap: () {},
    );
  }
}
