import 'package:flutter/widgets.dart';

enum ManualBlockType {
  heading,
  paragraph,
  bullets,
  image,
  annotatedImage,
  note
}

class ManualContentBlock {
  const ManualContentBlock._({
    required this.type,
    this.text,
    this.items,
    this.assetPath,
    this.caption,
    this.markers = const [],
    this.maxWidth,
  });

  const ManualContentBlock.heading(String text)
      : this._(type: ManualBlockType.heading, text: text);

  const ManualContentBlock.paragraph(String text)
      : this._(type: ManualBlockType.paragraph, text: text);

  const ManualContentBlock.bullets(List<String> items)
      : this._(type: ManualBlockType.bullets, items: items);

  const ManualContentBlock.image(String assetPath,
      {String? caption, String? text, double? maxWidth})
      : this._(
          type: ManualBlockType.image,
          assetPath: assetPath,
          caption: caption,
          text: text,
          maxWidth: maxWidth,
        );

  const ManualContentBlock.annotatedImage(
    String assetPath, {
    String? caption,
    List<ManualImageMarker> markers = const [],
    double? maxWidth,
  }) : this._(
          type: ManualBlockType.annotatedImage,
          assetPath: assetPath,
          caption: caption,
          markers: markers,
          maxWidth: maxWidth,
        );

  const ManualContentBlock.note(String text)
      : this._(type: ManualBlockType.note, text: text);

  final ManualBlockType type;
  final String? text;
  final List<String>? items;
  final String? assetPath;
  final String? caption;
  final List<ManualImageMarker> markers;
  final double? maxWidth;
}

class ManualImageMarker {
  const ManualImageMarker({
    required this.label,
    required this.alignment,
  });

  final String label;
  final Alignment alignment;
}

class ManualSectionContent {
  const ManualSectionContent({
    required this.entryId,
    required this.blocks,
  });

  final String entryId;
  final List<ManualContentBlock> blocks;
}
