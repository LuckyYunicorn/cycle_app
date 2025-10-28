import 'dart:io';

import 'package:bloc_project/core/utils/app_image_picker.dart';
import 'package:bloc_project/logic/image_picker/image_picker_event.dart';
import 'package:bloc_project/logic/image_picker/image_picker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerInitial()) {
    on<PickFromGallery>(_pickFromGallery);
  }

  Future<void> _pickFromGallery(
    PickFromGallery event,
    Emitter<ImagePickerState> emit,
  ) async {
    try {
      final XFile? file = await AppImagePickerAndCropper.imagePicker(imageSource: ImageSource.camera);

      if (file != null) {
        emit(ImagePickerDone(file: file));
      } else {
        emit(ImagePickerError(message: "No image picked"));
      }
    } catch (e) {
      emit(ImagePickerError(message: e.toString()));
    }
  }
}
