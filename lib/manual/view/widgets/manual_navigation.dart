import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../models/manual_section.dart';

class ManualNavigation extends StatelessWidget {
  const ManualNavigation({
    super.key,
    required this.items,
    required this.selectedEntry,
    required this.onSelect,
  });

  final List<ManualNavItem> items;
  final ManualEntry selectedEntry;
  final ValueChanged<ManualEntry> onSelect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: AppColors.surface,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 24),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 4),
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = item.entry.id == selectedEntry.id;
          final textStyle = theme.textTheme.bodyMedium!.copyWith(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500);
          return _ManualNavTile(
            item: item,
            isSelected: isSelected,
            textStyle: textStyle,
            onTap: () => onSelect(item.entry),
          );
        },
      ),
    );
  }
}

class _ManualNavTile extends StatefulWidget {
  const _ManualNavTile({
    required this.item,
    required this.isSelected,
    required this.textStyle,
    required this.onTap,
  });

  final ManualNavItem item;
  final bool isSelected;
  final TextStyle textStyle;
  final VoidCallback onTap;

  @override
  State<_ManualNavTile> createState() => _ManualNavTileState();
}

class _ManualNavTileState extends State<_ManualNavTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: widget.isSelected
                ? AppColors.primary.withOpacity(0.1)
                : Colors.transparent,
            border: widget.isSelected
                ? Border(left: BorderSide(color: AppColors.primary, width: 4))
                : null,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16 + widget.item.depth * 16,
          ),
          child: Text(
            widget.item.entry.title,
            style: widget.textStyle.copyWith(
              color: widget.isSelected
                  ? AppColors.primary
                  : (_hovered
                      ? Colors.red
                      : AppColors.neutral.withOpacity(0.85)),
            ),
          ),
        ),
      ),
    );
  }
}

class ManualNavItem {
  const ManualNavItem({required this.entry, required this.depth});

  final ManualEntry entry;
  final int depth;
}
