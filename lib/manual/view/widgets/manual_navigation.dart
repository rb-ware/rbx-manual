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
          return InkWell(
            onTap: () => onSelect(item.entry),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withOpacity(0.1)
                    : Colors.transparent,
                border: isSelected
                    ? Border(
                        left: BorderSide(color: AppColors.primary, width: 4))
                    : null,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16 + item.depth * 16,
              ),
              child: Text(
                item.entry.title,
                style: textStyle.copyWith(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.neutral.withOpacity(0.85),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ManualNavItem {
  const ManualNavItem({required this.entry, required this.depth});

  final ManualEntry entry;
  final int depth;
}
