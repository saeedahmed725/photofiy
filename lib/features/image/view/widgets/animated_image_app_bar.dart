import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofiy/features/image/view/bloc/image_actions_bloc.dart';

class AnimatedImageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Animation<double> fadeAnimation;
  final bool showDetails;
  final String imageUrl;
  final String imageName;

  const AnimatedImageAppBar({
    super.key,
    required this.fadeAnimation,
    required this.showDetails,
    required this.imageUrl,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      leading: AnimatedBuilder(
        animation: fadeAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: showDetails ? fadeAnimation.value : 0.0,
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          );
        },
      ),
      actions: [
        AnimatedBuilder(
          animation: fadeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: showDetails ? fadeAnimation.value : 0.0,
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: () {
                    context.read<ImageActionsBloc>().add(
                      ShareImageEvent(
                        imageUrl: imageUrl,
                        imageName: imageName,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
