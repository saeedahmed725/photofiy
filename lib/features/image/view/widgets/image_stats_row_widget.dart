import 'package:flutter/material.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';
import 'package:photofiy/features/image/view/widgets/stat_chip_widget.dart';

class ImageStatsRowWidget extends StatelessWidget {
  final PixabayImage image;

  const ImageStatsRowWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatChipWidget(
          icon: Icons.favorite,
          value: '${image.likes}',
          color: Colors.red,
        ),
        const SizedBox(width: 8),
        StatChipWidget(
          icon: Icons.download,
          value: '${image.downloads}',
          color: Colors.blue,
        ),
        const SizedBox(width: 8),
        StatChipWidget(
          icon: Icons.visibility,
          value: '${image.views}',
          color: Colors.green,
        ),
      ],
    );
  }
}
