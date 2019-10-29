const String kTypeImage = 'image';
const String kTypeVideo = 'video';

/// Specifies the source where the picked image should come from.
enum ImageSource {
  /// Opens up the device camera, letting the user to take a new picture.
  camera,

  /// Opens the user's photo gallery.
  gallery,
}

/// The type of the retrieved data in a [LostDataResponse].
enum RetrieveType { image, video }