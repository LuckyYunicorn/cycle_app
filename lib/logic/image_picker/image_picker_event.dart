import 'package:equatable/equatable.dart';

sealed class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PickFromGallery extends ImagePickerEvent {}

class PickFromCamera extends ImagePickerEvent {}
