import 'dart:typed_data';

class StoredMedia {
  final Uint8List data;
  final String type;
  final String filePath;

  const StoredMedia(this.data, this.type, this.filePath);
}
