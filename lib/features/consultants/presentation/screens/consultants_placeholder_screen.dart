import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';

class ConsultantsPlaceholderScreen extends StatelessWidget {
  const ConsultantsPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.featureConsultants),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.psychology_rounded, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Expert Advisory Module Foundation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Feature architecture initialized.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
