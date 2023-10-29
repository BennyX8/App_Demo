import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../models/stored_media.dart';
import 'single_selection_thumbnail_view.dart';

class SingleSelectionMediaGrid extends StatefulWidget {
  const SingleSelectionMediaGrid({super.key});

  @override
  State<SingleSelectionMediaGrid> createState() =>
      _SingleSelectionMediaGridState();
}

class _SingleSelectionMediaGridState extends State<SingleSelectionMediaGrid> {
  int currentPage = 0;
  late int lastPage;

  StoredMedia? selected;

  @override
  void initState() {
    super.initState();
    fetchNewMedia();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scroll) {
        handleScrollEvent(scroll);
        return true;
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Upload Media'),
                Row(
                  children: [
                    IconButton(
                      splashRadius: 26,
                      onPressed: () => Navigator.pop(context, selected),
                      icon: Icon(
                        selected == null ? Icons.close : Icons.check,
                        color: selected == null ? Colors.black : Colors.orange,
                      ),
                    ),
                    selected == null
                        ? const SizedBox.shrink()
                        : const Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchNewMedia(),
              builder: (context, snap) {
                if (snap.hasData) {
                  return GridView.builder(
                    itemCount: snap.data!.length,
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final data = snap.data![index];

                      final media = StoredMedia(
                        data.$1!,
                        data.$3.name.toUpperCase(),
                        data.$2!.path,
                      );

                      return SingleSelectionThumbnailView(
                        media: media,
                        isSelected: selected == media,
                        selection: (p0) {
                          setState(() {
                            selected = media;
                          });
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('Loading media files'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        fetchNewMedia();

        currentPage++;
      }
    }
  }

  Future<List<(Uint8List?, File?, AssetType, String)>> fetchNewMedia() async {
    lastPage = currentPage;
    List<(Uint8List?, File?, AssetType, String)> assets = [];

    final result = await PhotoManager.requestPermissionExtend();

    if (result == PermissionState.authorized) {
      // Load album list
      final albums = await PhotoManager.getAssetPathList(onlyAll: true);

      List<AssetEntity> media = await albums[0].getAssetListPaged(
        page: currentPage,
        size: 60,
      );

      for (final asset in media) {
        if (asset.type == AssetType.image) {
          final mediaData = await asset.thumbnailDataWithSize(
            const ThumbnailSize.square(100),
          );

          String? mime =
              lookupMimeType((await asset.file)!.path, headerBytes: mediaData);

          assets.add((mediaData, await asset.file, asset.type, mime!));
        }
      }
    } else {
      PhotoManager.openSetting();
    }
    return assets;
  }
}
