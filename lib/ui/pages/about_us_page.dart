import 'package:flutter/material.dart';

import '../coustom_widget/custom_bullet_point.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Text(
                  'Red Love',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Version 0.0.1',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Red Love is a comprehensive platform designed to streamline the process of blood donation and management. Our app connects blood donors with those in need, making it easier to find and request donations in emergencies. Key features include:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              BulletPoint(text: 'Find Blood Donors: Quickly locate nearby blood donors based on your blood type and urgency.'),
              BulletPoint(text: 'Request Donations: Easily request blood donations and notify potential donors.'),
              BulletPoint(text: 'Accept Requests: As a donor, browse and accept blood donation requests that match your availability and blood type.'),
              BulletPoint(text: 'Blood Inventory Management: Maintain an organized inventory of blood types available, with real-time updates.'),
              BulletPoint(text: 'User Profiles: Create and manage your profile, detailing your blood type, donation history, and availability.'),
              BulletPoint(text: 'Notifications: Receive timely notifications for donation requests and reminders for scheduled donations.'),
              BulletPoint(text: 'Secure Data Handling: We prioritize your privacy and ensure that all data is securely handled.'),
              const SizedBox(height: 16),
              const Text('Join Red Love to become a part of a lifesaving community. Together, we can make a difference!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Contact Us:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Email: devolopersabbir0@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Website: http://48.217.146.162/',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}