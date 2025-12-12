import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../models/manual_content.dart';
import '../../models/manual_section.dart';

class ManualContentView extends StatelessWidget {
  const ManualContentView({
    super.key,
    required this.entry,
    this.content,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
  });

  final ManualEntry entry;
  final ManualSectionContent? content;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entry.title,
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          if (content != null)
            ..._buildBlocks(context, content!)
          else if (entry.hasChildren)
            ..._buildChildSummary(entry)
          else ...[
            Text(
              '섹션 콘텐츠를 여기에 작성하세요. 텍스트, 이미지, 표 등을 자유롭게 구성할 수 있습니다.',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: 24),
            const ManualContentPlaceholder(),
          ],
        ],
      ),
    );
  }

  List<Widget> _buildBlocks(
      BuildContext context, ManualSectionContent section) {
    final theme = Theme.of(context);
    return section.blocks.map((block) {
      switch (block.type) {
        case ManualBlockType.heading:
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              block.text ?? '',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          );
        case ManualBlockType.paragraph:
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              block.text ?? '',
              style: AppTypography.bodyMedium,
            ),
          );
        case ManualBlockType.bullets:
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: block.items!
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '•',
                            style: AppTypography.bodyMedium.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              item,
                              style: AppTypography.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        case ManualBlockType.image:
          return LayoutBuilder(builder: (context, constraints) {
            final borderRadius = BorderRadius.circular(8);
            final baseImage = Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary.withOpacity(0.1),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: borderRadius,
                child: Image.asset(block.assetPath!),
              ),
            );
            final imageWidget = block.maxWidth != null
                ? SizedBox(width: block.maxWidth, child: baseImage)
                : baseImage;

            final double captionWidth = block.maxWidth ??
                (constraints.maxWidth.isFinite
                    ? constraints.maxWidth
                    : MediaQuery.of(context).size.width);

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageWidget,
                  if (block.caption != null) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: captionWidth,
                      child: Text(
                        block.caption!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.neutral.withOpacity(0.7),
                                ) ??
                            AppTypography.bodyMedium.copyWith(
                              fontSize: 14,
                              color: AppColors.neutral.withOpacity(0.7),
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ],
              ),
            );
          });
        case ManualBlockType.annotatedImage:
          return LayoutBuilder(builder: (context, constraints) {
            final imageWidget = block.maxWidth != null
                ? SizedBox(
                    width: block.maxWidth, child: _AnnotatedImage(block: block))
                : _AnnotatedImage(block: block);

            final double captionWidth = block.maxWidth ??
                (constraints.maxWidth.isFinite
                    ? constraints.maxWidth
                    : MediaQuery.of(context).size.width);

            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageWidget,
                  if (block.caption != null) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: captionWidth,
                      child: Text(
                        block.caption!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.neutral.withOpacity(0.7),
                                ) ??
                            AppTypography.bodyMedium.copyWith(
                              fontSize: 14,
                              color: AppColors.neutral.withOpacity(0.7),
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ],
              ),
            );
          });
        case ManualBlockType.note:
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.GREY_LIGHT,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                block.text ?? '',
                style: AppTypography.bodyMedium,
              ),
            ),
          );
      }
    }).toList();
  }

  List<Widget> _buildChildSummary(ManualEntry entry) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: entry.children
            .map(
              (child) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '•',
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        child.title,
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
      const SizedBox(height: 24),
      const ManualContentPlaceholder(),
    ];
  }
}

class _ImageMarkerBadge extends StatelessWidget {
  const _ImageMarkerBadge(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.grey200,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.1),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Text(
        label,
        style: AppTypography.bodyMedium.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class _AnnotatedImage extends StatefulWidget {
  const _AnnotatedImage({
    required this.block,
  });

  final ManualContentBlock block;

  @override
  State<_AnnotatedImage> createState() => _AnnotatedImageState();
}

class _AnnotatedImageState extends State<_AnnotatedImage> {
  ImageStream? _imageStream;
  ImageStreamListener? _listener;
  Size? _imageSize;

  @override
  void initState() {
    super.initState();
    _resolveImage();
  }

  @override
  void didUpdateWidget(covariant _AnnotatedImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.block.assetPath != widget.block.assetPath) {
      _unsubscribe();
      _imageSize = null;
      _resolveImage();
    }
  }

  @override
  void dispose() {
    _unsubscribe();
    super.dispose();
  }

  void _resolveImage() {
    final imageProvider = AssetImage(widget.block.assetPath!);
    final stream = imageProvider.resolve(const ImageConfiguration());
    _listener ??= ImageStreamListener(_handleImageFrame);
    stream.addListener(_listener!);
    _imageStream = stream;
  }

  void _unsubscribe() {
    if (_imageStream != null && _listener != null) {
      _imageStream!.removeListener(_listener!);
      _imageStream = null;
    }
  }

  void _handleImageFrame(ImageInfo info, bool _) {
    setState(() {
      _imageSize = Size(
        info.image.width.toDouble(),
        info.image.height.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);

    Widget content;

    if (_imageSize == null) {
      content = ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset(widget.block.assetPath!),
      );
    } else {
      final aspectRatio = _imageSize!.width / _imageSize!.height;
      content = ClipRRect(
        borderRadius: borderRadius,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(widget.block.assetPath!, fit: BoxFit.cover),
              for (final marker in widget.block.markers)
                Align(
                  alignment: marker.alignment,
                  child: _ImageMarkerBadge(marker.label),
                ),
            ],
          ),
        ),
      );
    }

    content = Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.1),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: content,
    );

    if (widget.block.maxWidth != null) {
      content = SizedBox(width: widget.block.maxWidth, child: content);
    }

    return content;
  }
}

class ManualContentPlaceholder extends StatelessWidget {
  const ManualContentPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.secondary.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '콘텐츠 작성 팁',
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(
            '· 설명 텍스트는 단락으로 나누어 가독성을 높입니다.\n'
            '· 필요한 경우 이미지나 다이어그램을 추가하고 캡션을 달아 주세요.\n'
            '· 안전 주의, 팁과 같은 강조 요소는 별도 박스로 노출하면 좋아요.',
            style: AppTypography.bodyMedium,
          ),
        ],
      ),
    );
  }
}
