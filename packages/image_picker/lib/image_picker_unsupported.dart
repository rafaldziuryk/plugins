// Copyright 2019 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'image_picker_const.dart';

class ImagePicker {

  static Future<File> pickImage(
      {@required ImageSource source,
      double maxWidth,
      double maxHeight,
      int imageQuality}) async => Future<File>.error(PlatformException(code: "100", message: "Unsupported"));

  static Future<File> pickVideo({
    @required ImageSource source,
  }) async => Future<File>.error(PlatformException(code: "100", message: "Unsupported"));

 static Future<LostDataResponse> retrieveLostData() async => Future<LostDataResponse>.error(PlatformException(code: "100", message: "Unsupported"));
}

/// The response object of [ImagePicker.retrieveLostData].
///
/// Only applies to Android.
/// See also:
/// * [ImagePicker.retrieveLostData] for more details on retrieving lost data.
class LostDataResponse {
  LostDataResponse({this.file, this.exception, this.type});

  LostDataResponse.empty()
      : file = null,
        exception = null,
        type = null {
    _empty = true;
  }

  /// Whether it is an empty response.
  ///
  /// An empty response should have [file], [exception] and [type] to be null.
  bool get isEmpty => _empty;

  /// The file that was lost in a previous [pickImage] or [pickVideo] call due to MainActivity being destroyed.
  ///
  /// Can be null if [exception] exists.
  final File  file;

  /// The exception of the last [pickImage] or [pickVideo].
  ///
  /// If the last [pickImage] or [pickVideo] threw some exception before the MainActivity destruction, this variable keeps that
  /// exception.
  /// You should handle this exception as if the [pickImage] or [pickVideo] got an exception when the MainActivity was not destroyed.
  ///
  /// Note that it is not the exception that caused the destruction of the MainActivity.
  final PlatformException exception;

  /// Can either be [RetrieveType.image] or [RetrieveType.video];
  final RetrieveType type;

  bool _empty = false;
}
