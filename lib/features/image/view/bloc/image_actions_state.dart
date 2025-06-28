part of 'image_actions_bloc.dart';

abstract class ImageActionsState {}

class ImageActionsInitial extends ImageActionsState {}

class ImageActionsLoading extends ImageActionsState {
  final String action;

  ImageActionsLoading({required this.action});
}

class ImageActionsSuccess extends ImageActionsState {
  final String message;
  final String action;

  ImageActionsSuccess({required this.message, required this.action});
}

class ImageActionsFailure extends ImageActionsState {
  final String error;
  final String action;

  ImageActionsFailure({required this.error, required this.action});
}
