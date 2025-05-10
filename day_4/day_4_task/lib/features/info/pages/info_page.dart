import 'package:day_4_task/features/info/widgets/custom_info_app_bar.dart';
import 'package:day_4_task/features/info/widgets/personal_information.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInfoAppBar(),
            const SizedBox(height: 20),
            PersonalInformation(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Main',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),

                  Text(
                    '+1 202 555 0181',
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    color: Colors.grey.withValues(alpha: 0.4),
                    thickness: 1,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Home',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),

                  Text(
                    '+1 202 555 0113',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Bio',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),

                  Text(
                    'I am a Flutter developer with 3 years of experience.',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Divider(
                    color: Colors.grey.withValues(alpha: 0.4),
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Text(
                        'Notifications',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Enabled',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Divider(
                    color: Colors.grey.withValues(alpha: 0.4),
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),

                  Text(
                    'Delete Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Divider(
                    color: Colors.grey.withValues(alpha: 0.4),
                    thickness: 1,
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
