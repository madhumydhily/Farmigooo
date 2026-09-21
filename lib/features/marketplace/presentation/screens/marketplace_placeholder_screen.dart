import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';

class MarketplacePlaceholderScreen extends StatelessWidget {
  const MarketplacePlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.featureMarketplace),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.storefront_rounded, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Produce Marketplace Module Foundation',
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
