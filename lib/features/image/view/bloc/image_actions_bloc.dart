import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofiy/core/shared/image_utils.dart';

part 'image_actions_event.dart';
part 'image_actions_state.dart';

class ImageActionsBloc extends Bloc<ImageActionsEvent, ImageActionsState> {
  ImageActionsBloc() : super(ImageActionsInitial()) {
    on<ShareImageEvent>(_onShareImage);
    on<DownloadImageEvent>(_onDownloadImage);
    on<SetWallpaperEvent>(_onSetWallpaper);
    on<ResetStateEvent>(_onResetState);
  }

  Future<void> _onShareImage(
    ShareImageEvent event,
    Emitter<ImageActionsState> emit,
  ) async {
    emit(ImageActionsLoading(action: 'share'));

    try {
      final success = await ImageUtils.shareImage(
        event.imageUrl,
        event.imageName,
      );

      if (success) {
        emit(
          ImageActionsSuccess(
            message: 'Image shared successfully!',
            action: 'share',
          ),
        );
      } else {
        emit(
          ImageActionsFailure(error: 'Failed to share image', action: 'share'),
        );
      }
    } catch (e) {
      emit(
        ImageActionsFailure(
          error: 'Error sharing image: ${e.toString()}',
          action: 'share',
        ),
      );
    }
  }

  Future<void> _onDownloadImage(
    DownloadImageEvent event,
    Emitter<ImageActionsState> emit,
  ) async {
    emit(ImageActionsLoading(action: 'download'));

    try {
      final success = await ImageUtils.downloadImage(
        event.imageUrl,
        event.imageName,
      );

      if (success) {
        emit(
          ImageActionsSuccess(
            message: 'Image downloaded successfully!',
            action: 'download',
          ),
        );
      } else {
        emit(
          ImageActionsFailure(
            error: 'Failed to download image. Please check permissions.',
            action: 'download',
          ),
        );
      }
    } catch (e) {
      emit(
        ImageActionsFailure(
          error: 'Error downloading image: ${e.toString()}',
          action: 'download',
        ),
      );
    }
  }

  Future<void> _onSetWallpaper(
    SetWallpaperEvent event,
    Emitter<ImageActionsState> emit,
  ) async {
    emit(ImageActionsLoading(action: 'wallpaper'));

    try {
      final success = await ImageUtils.setAsWallpaper(event.imageUrl, event.location);

      if (success) {
        emit(
          ImageActionsSuccess(
            message: 'Wallpaper set successfully!',
            action: 'wallpaper',
          ),
        );
      } else {
        emit(
          ImageActionsFailure(
            error: 'Failed to set wallpaper. Please check permissions.',
            action: 'wallpaper',
          ),
        );
      }
    } catch (e) {
      emit(
        ImageActionsFailure(
          error: 'Error setting wallpaper: ${e.toString()}',
          action: 'wallpaper',
        ),
      );
    }
  }

  void _onResetState(ResetStateEvent event, Emitter<ImageActionsState> emit) {
    emit(ImageActionsInitial());
  }
}
