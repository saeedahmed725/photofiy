import 'package:flutter/material.dart';
import 'package:photofiy/core/constants/app_color.dart';
import 'package:photofiy/core/utils/components/sheets.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class WallpaperLocationBottomSheet extends StatelessWidget {
  final Function(int) onLocationSelected;

  const WallpaperLocationBottomSheet({
    super.key,
    required this.onLocationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title
          const Text(
            'Set Wallpaper',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          const Text(
            'Choose where to apply the wallpaper',
            style: TextStyle(fontSize: 16, color: Colors.white70),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30),

          // Home Screen Button
          _buildOptionButton(
            context: context,
            icon: Icons.home,
            title: 'Home Screen',
            subtitle: 'Set as home screen wallpaper',
            onTap: () {
              Navigator.pop(context);
              onLocationSelected(WallpaperManagerFlutter.homeScreen);
            },
          ),

          const SizedBox(height: 12),

          // Lock Screen Button
          _buildOptionButton(
            context: context,
            icon: Icons.lock,
            title: 'Lock Screen',
            subtitle: 'Set as lock screen wallpaper',
            onTap: () {
              Navigator.pop(context);
              onLocationSelected(WallpaperManagerFlutter.lockScreen);
            },
          ),

          const SizedBox(height: 12),

          // Both Screens Button
          _buildOptionButton(
            context: context,
            icon: Icons.wallpaper,
            title: 'Both Screens',
            subtitle: 'Set as wallpaper for home and lock screen',
            onTap: () {
              Navigator.pop(context);
              onLocationSelected(WallpaperManagerFlutter.bothScreens);
            },
          ),

          const SizedBox(height: 20),

          // Cancel Button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildOptionButton({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white30),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
            ],
          ),
        ),
      ),
    );
  }

  static void show(BuildContext context, Function(int) onLocationSelected) {
    Sheets.showModel(
      context,
      backgroundColor: AppColor.kDarkBlueColor,
      isScrollControlled: true,
      child: WallpaperLocationBottomSheet(
        onLocationSelected: onLocationSelected,
      ),
    );
  }
}
