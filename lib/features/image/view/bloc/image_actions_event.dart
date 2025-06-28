part of 'image_actions_bloc.dart';

abstract class ImageActionsEvent {}

class ShareImageEvent extends ImageActionsEvent {
  final String imageUrl;
  final String imageName;

  ShareImageEvent({required this.imageUrl, required this.imageName});
}

class DownloadImageEvent extends ImageActionsEvent {
  final String imageUrl;
  final String imageName;

  DownloadImageEvent({required this.imageUrl, required this.imageName});
}

class SetWallpaperEvent extends ImageActionsEvent {
  final String imageUrl;
  final int location;
  SetWallpaperEvent({required this.imageUrl, required this.location});
}

class ResetStateEvent extends ImageActionsEvent {}
