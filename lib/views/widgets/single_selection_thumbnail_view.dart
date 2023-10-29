import 'package:flutter/material.dart';
import '../../models/stored_media.dart';

class SingleSelectionThumbnailView extends StatelessWidget {
  final StoredMedia media;
  final bool isSelected;
  final void Function(StoredMedia) selection;

  const SingleSelectionThumbnailView({
    super.key,
    required this.media,
    required this.selection,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => selection(media),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? Colors.orange : Colors.transparent,
              width: 5.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.memory(
              (media.data),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
