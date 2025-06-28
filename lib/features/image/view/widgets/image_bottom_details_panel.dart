import 'package:flutter/material.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';
import 'package:photofiy/features/image/view/widgets/image_stats_row_widget.dart';
import 'package:photofiy/features/image/view/widgets/image_details_widget.dart';
import 'package:photofiy/features/image/view/widgets/image_action_buttons_widget.dart';

class ImageBottomDetailsPanel extends StatelessWidget {
  final PixabayImage image;
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;
  final bool showDetails;

  const ImageBottomDetailsPanel({
    super.key,
    required this.image,
    required this.slideAnimation,
    required this.fadeAnimation,
    required this.showDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: slideAnimation,
        builder: (context, child) {
          return SlideTransition(
            position: slideAnimation,
            child: AnimatedBuilder(
              animation: fadeAnimation,
              builder: (context, child) {
                return AnimatedOpacity(
                  opacity: showDetails ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                          Colors.black.withValues(alpha: 0.9),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: SafeArea(
                      top: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Image Stats Row
                          ImageStatsRowWidget(image: image),

                          const SizedBox(height: 16),

                          // Image Details (tags, resolution, author)
                          ImageDetailsWidget(image: image),

                          const SizedBox(height: 20),

                          // Action Buttons
                          ImageActionButtonsWidget(
                            imageUrl: image.largeImageURL,
                            imageName: image.tags.split(',').first.trim(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
