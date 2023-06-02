/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHandler {
  XFile? _imageFile;
  ImagePicker? _imagePicker;

  /// This method is used for initialization ImagePicker
  void init() {
    _imagePicker = ImagePicker();
  }

  XFile? get getImage => _imageFile;

  /// This method is used for opening camera
  Future<ImagePickStatus> openCamera() async {
    try {
      final pickedFile = await _imagePicker?.pickImage(
        source: ImageSource.camera,
        maxWidth: 800,
        maxHeight: 800,
      );
      _imageFile = pickedFile;
      return ImagePickStatus.picked;
    } catch (e) {
      adLog(e.toString());
      if (e is PlatformException) {
        if (e.code.contains('denied')) {
          return ImagePickStatus.permissionDenied;
        }
      }
      return ImagePickStatus.error;
    }
  }

  /// This method is used for opening Gallery
  Future<ImagePickStatus> openGallery() async {
    try {
      final pickedFile = await _imagePicker?.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
      );
      if (pickedFile != null) {
        _imageFile = pickedFile;
        return ImagePickStatus.picked;
      }
      return ImagePickStatus.notPicked;
    } catch (e) {
      adLog(e.toString());
      if (e is PlatformException) {
        if (e.code.contains('denied')) {
          return ImagePickStatus.permissionDenied;
        }
      }
      return ImagePickStatus.error;
    }
  }
}

enum ImagePickStatus { picked, notPicked, permissionDenied, error }
