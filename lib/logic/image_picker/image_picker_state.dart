import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

sealed class ImagePickerState extends Equatable {
  const ImagePickerState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ImagePickerInitial extends ImagePickerState {}

class ImagePickerDone extends ImagePickerState {
  final XFile file;
  const ImagePickerDone({required this.file});
  @override
  // TODO: implement props
  List<Object?> get props => [file];
}

class ImagePickerError extends ImagePickerState {
  final String message;
  const ImagePickerError({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
