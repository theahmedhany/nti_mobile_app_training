import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(height: 50),
        Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              'assets/profile_pics/profile_image.jpg',
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Text("Ahmed Hany", style: textTheme.headlineMedium),
        Text("Flutter Developer", style: textTheme.bodyLarge),
        Text("100 Points", style: textTheme.bodyLarge),
        SizedBox(height: 100),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
          leading: Icon(Icons.settings),
          title: Text("Settings", style: textTheme.bodyLarge),
          onTap: () {},
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
          leading: Icon(Icons.help),
          title: Text("Help", style: textTheme.bodyLarge),
          onTap: () {},
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
          leading: Icon(Icons.logout),
          title: Text("Logout", style: textTheme.bodyLarge),
          onTap: () {},
        ),
      ],
    );
  }
}
