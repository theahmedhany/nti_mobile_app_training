import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
        title: const Text(
          'Privacy',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Who can see my personal info',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    const SizedBox(height: 20),
                    PrivacyListTile(
                      title: 'Last seen and online',
                      subTitle: 'everyone',
                      icon: Icons.arrow_forward_ios_sharp,
                      iconColor: Colors.grey,
                    ),
                    Divider(
                      color: Colors.grey.withValues(alpha: 0.3),
                      thickness: 1,
                    ),
                    PrivacyListTile(
                      title: 'Profile photo',
                      subTitle: 'Everyone',
                      icon: Icons.arrow_forward_ios_sharp,
                      iconColor: Colors.grey,
                    ),
                    Divider(
                      color: Colors.grey.withValues(alpha: 0.3),
                      thickness: 1,
                    ),
                    PrivacyListTile(
                      title: 'About',
                      subTitle: 'Everyone',
                      icon: Icons.arrow_forward_ios_sharp,
                      iconColor: Colors.grey,
                    ),
                    Divider(
                      color: Colors.grey.withValues(alpha: 0.3),
                      thickness: 1,
                    ),
                    PrivacyListTile(
                      title: 'Read receipts',
                      subTitle:
                          'If turned off, you won\'t be able to see read receipts. Read receipts are always sent for group chats.',
                      icon: Icons.check_box,
                      iconColor: Colors.green,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Disappear messages',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    const SizedBox(height: 20),
                    PrivacyListTile(
                      title: 'Default message timer',
                      subTitle: 'Off',
                      icon: Icons.arrow_forward_ios_sharp,
                      iconColor: Colors.grey,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrivacyListTile(
                      title: 'Group',
                      subTitle: 'Everyone',
                      icon: Icons.arrow_forward_ios_sharp,
                      iconColor: Colors.grey,
                    ),
                    PrivacyListTile(
                      title: 'Blocked contacts',
                      subTitle: 'None',
                      icon: Icons.arrow_forward_ios_sharp,
                      iconColor: Colors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyListTile extends StatelessWidget {
  const PrivacyListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.iconColor,
  });

  final String title, subTitle;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 18)),
      subtitle: Text(subTitle, style: TextStyle(color: Colors.grey)),
      trailing: Icon(icon, color: iconColor),
    );
  }
}
