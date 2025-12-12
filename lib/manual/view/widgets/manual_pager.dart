import 'package:flutter/material.dart';

import '../../models/manual_section.dart';

class ManualPagerFooter extends StatelessWidget {
  const ManualPagerFooter({
    super.key,
    required this.onSelect,
    this.prev,
    this.next,
  });

  final ManualEntry? prev;
  final ManualEntry? next;
  final ValueChanged<ManualEntry> onSelect;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle baseStyle = OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

    final Widget prevBtn = prev != null
        ? OutlinedButton.icon(
            style: baseStyle,
            onPressed: () => onSelect(prev!),
            icon: const Icon(Icons.arrow_back),
            label: Text(
              '이전: ${prev!.title}',
              overflow: TextOverflow.ellipsis,
            ),
          )
        : const SizedBox.shrink();

    final Widget nextBtn = next != null
        ? OutlinedButton.icon(
            style: baseStyle,
            onPressed: () => onSelect(next!),
            icon: const Icon(Icons.arrow_forward),
            label: Text(
              '다음: ${next!.title}',
              overflow: TextOverflow.ellipsis,
            ),
          )
        : const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        Row(
          children: [
            prev != null
                ? Expanded(
                    child:
                        Align(alignment: Alignment.centerLeft, child: prevBtn))
                : const Spacer(),
            const SizedBox(width: 16),
            next != null
                ? Expanded(
                    child:
                        Align(alignment: Alignment.centerRight, child: nextBtn))
                : const Spacer(),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
