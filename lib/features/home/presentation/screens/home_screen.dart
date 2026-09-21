import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/routes/app_routes.dart';

/// FARMIGO Dashboard Placeholder Screen.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.agriculture_rounded, color: AppColors.primaryGreen),
            SizedBox(width: 8),
            Text(
              AppStrings.appName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.notifications),
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.login),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppColors.paddingMedium),
          children: [
            // Welcome Header Card
            Card(
              color: AppColors.primaryGreen,
              child: Padding(
                padding: const EdgeInsets.all(AppColors.paddingLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.appName,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppStrings.appTagline,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppColors.paddingLarge),

            Text(
              'Platform Modules Foundation',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppColors.paddingSmall),
            Text(
              'Select a module to view its modular architectural placeholder.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
            ),
            const SizedBox(height: AppColors.paddingMedium),

            // Feature Navigation Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
              crossAxisSpacing: AppColors.paddingMedium,
              mainAxisSpacing: AppColors.paddingMedium,
              children: [
                _ModuleCard(
                  title: AppStrings.featureLand,
                  icon: Icons.landscape_rounded,
                  color: const Color(0xFF5D4037),
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.land),
                ),
                _ModuleCard(
                  title: AppStrings.featureMachinery,
                  icon: Icons.precision_manufacturing_rounded,
                  color: const Color(0xFFE65100),
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.machinery),
                ),
                _ModuleCard(
                  title: AppStrings.featureWorkers,
                  icon: Icons.groups_rounded,
                  color: const Color(0xFF0288D1),
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.workers),
                ),
                _ModuleCard(
                  title: AppStrings.featureMarketplace,
                  icon: Icons.storefront_rounded,
                  color: const Color(0xFF2E7D32),
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.marketplace),
                ),
                _ModuleCard(
                  title: AppStrings.featureConsultants,
                  icon: Icons.psychology_rounded,
                  color: const Color(0xFF6A1B9A),
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.consultants),
                ),
                _ModuleCard(
                  title: AppStrings.featureAgriculture,
                  icon: Icons.eco_rounded,
                  color: const Color(0xFF00897B),
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.agriculture),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ModuleCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppColors.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(height: AppColors.paddingMedium),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
