import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';

class AnimatedHeroImageWidget extends StatelessWidget {
  final PixabayImage image;
  final Animation<double> scaleAnimation;

  const AnimatedHeroImageWidget({
    super.key,
    required this.image,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'image_${image.id}',
        child: InteractiveViewer(
          minScale: 0.5,
          maxScale: 3.0,
          child: AnimatedBuilder(
            animation: scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: scaleAnimation.value,
                child: CachedNetworkImage(
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                  height: double.infinity,
                  imageUrl: image.largeImageURL,
                  placeholder: (context, url) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          Colors.white.withValues(alpha: 0.7),
                        ),
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.white.withValues(alpha: 0.7),
                        size: 32,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
