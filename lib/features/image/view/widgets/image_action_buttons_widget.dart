import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofiy/features/image/view/bloc/image_actions_bloc.dart';
import 'package:photofiy/features/image/view/widgets/wallpaper_location_bottom_sheet.dart';

class ImageActionButtonsWidget extends StatelessWidget {
  final String imageUrl;
  final String imageName;

  const ImageActionButtonsWidget({
    super.key,
    required this.imageUrl,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageActionsBloc, ImageActionsState>(
      builder: (context, state) {
        final isLoading = state is ImageActionsLoading;
        final isWallpaperLoading = isLoading && state.action == 'wallpaper';
        final isDownloadLoading = isLoading && state.action == 'download';

        return Row(
          children: [
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: ElevatedButton.icon(
                  onPressed: isWallpaperLoading
                      ? null
                      : () {
                          WallpaperLocationBottomSheet.show(context, (value) {
                            context.read<ImageActionsBloc>().add(
                              SetWallpaperEvent(
                                imageUrl: imageUrl,
                                location: value,
                              ),
                            );
                          });
                        },
                  icon: isWallpaperLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.wallpaper),
                  label: Text(
                    isWallpaperLoading ? 'Setting...' : 'Set as Wallpaper',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: isDownloadLoading
                    ? null
                    : () {
                        context.read<ImageActionsBloc>().add(
                          DownloadImageEvent(
                            imageUrl: imageUrl,
                            imageName: imageName,
                          ),
                        );
                      },
                icon: isDownloadLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.download, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
