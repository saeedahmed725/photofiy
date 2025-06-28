import 'package:flutter/material.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';

class ImageDetailsWidget extends StatelessWidget {
  final PixabayImage image;

  const ImageDetailsWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tags
        Text(
          image.tags,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(height: 12),

        // Resolution info
        Text(
          '${image.imageWidth} × ${image.imageHeight}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 12),

        // Author info
        Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundImage: image.userImageURL.isNotEmpty
                  ? NetworkImage(image.userImageURL)
                  : null,
              child: image.userImageURL.isEmpty
                  ? const Icon(Icons.person, size: 16)
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              'by ${image.user}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
