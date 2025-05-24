import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void _showNotAvailableDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(color: Colors.transparent),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: const Text(
                  'Not Available right now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.person, 'label': 'Account'},
      {'icon': Icons.settings, 'label': 'Settings'},
      {'icon': Icons.notifications, 'label': 'Notifications'},
      {'icon': Icons.lock, 'label': 'Privacy'},
      {'icon': Icons.logout, 'label': 'Logout'},
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 44,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/194326068?v=4'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Mohamed Tohamy',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'tohamydev@gmail.com',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Colors.blueAccent, size: 18),
                      const SizedBox(width: 6),
                      const Text(
                        '+201004724510',
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.location_on, color: Colors.redAccent, size: 18),
                      const SizedBox(width: 6),
                      const Text(
                        'Cairo, Egypt',
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Image.asset(AppAssets.linkidin, height: 22),
                            const SizedBox(width: 6),
                            const Text('in/tohamydev',
                                style:
                                TextStyle(fontSize: 14, color: Colors.blue)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 18),
                      InkWell(
                        child: Row(
                          children: [
                            Image.asset(AppAssets.github, height: 22),
                            const SizedBox(width: 6),
                            const Text('github.com/tohamydev',
                                style:
                                TextStyle(fontSize: 14, color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Experienced Flutter developer with 3 years of experience in building high-performance and low-latency cross-platform mobile applications',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF8F8F8),
    );
  }
}
