import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../data/manual_toc.dart';
import '../models/manual_section.dart';

class ManualPage extends StatefulWidget {
  const ManualPage({super.key});

  @override
  State<ManualPage> createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
  late final List<_NavItem> _navItems;
  late ManualEntry _selectedEntry;

  @override
  void initState() {
    super.initState();
    _navItems = _buildNavItems(manualToc);
    _selectedEntry = _navItems.first.entry;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 900;
        if (isCompact) {
          return _CompactManualPage(
            navItems: _navItems,
            selectedEntry: _selectedEntry,
            onSelect: _onSelect,
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('RB X Manual'),
          ),
          body: Row(
            children: [
              SizedBox(width: 300, child: _buildNavigation(context)),
              const VerticalDivider(width: 1, thickness: 1),
              Expanded(child: _buildContent(context)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavigation(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: AppColors.surface,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 24),
        itemCount: _navItems.length,
        separatorBuilder: (context, index) => const SizedBox(height: 4),
        itemBuilder: (context, index) {
          final item = _navItems[index];
          final isSelected = item.entry.id == _selectedEntry.id;
          final textStyle = theme.textTheme.bodyMedium!.copyWith(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500);
          return InkWell(
            onTap: () => _onSelect(item.entry),
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

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _selectedEntry.title,
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 24),
          if (_selectedEntry.hasChildren)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _selectedEntry.children
                  .map(
                    (child) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '•',
                            style: AppTypography.bodyMedium
                                .copyWith(fontWeight: FontWeight.w700),
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
            )
          else
            Text(
              '섹션 콘텐츠를 여기에 작성하세요. 텍스트, 이미지, 표 등을 자유롭게 구성할 수 있습니다.',
              style: AppTypography.bodyMedium,
            ),
          const SizedBox(height: 40),
          _buildContentPlaceholder(theme),
        ],
      ),
    );
  }

  Widget _buildContentPlaceholder(ThemeData theme) {
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

  void _onSelect(ManualEntry entry) {
    setState(() {
      _selectedEntry = entry;
    });
  }

  List<_NavItem> _buildNavItems(List<ManualEntry> entries, {int depth = 0}) {
    final items = <_NavItem>[];
    for (final entry in entries) {
      items.add(_NavItem(entry: entry, depth: depth));
      if (entry.children.isNotEmpty) {
        items.addAll(_buildNavItems(entry.children, depth: depth + 1));
      }
    }
    return items;
  }
}

class _NavItem {
  const _NavItem({required this.entry, required this.depth});

  final ManualEntry entry;
  final int depth;
}

class _CompactManualPage extends StatefulWidget {
  const _CompactManualPage({
    required this.navItems,
    required this.selectedEntry,
    required this.onSelect,
  });

  final List<_NavItem> navItems;
  final ManualEntry selectedEntry;
  final ValueChanged<ManualEntry> onSelect;

  @override
  State<_CompactManualPage> createState() => _CompactManualPageState();
}

class _CompactManualPageState extends State<_CompactManualPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('RB X Manual'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.GREY_LIGHT,
        child: SafeArea(child: _buildDrawerContent(context)),
      ),
      body: _ManualContentView(entry: widget.selectedEntry),
    );
  }

  Widget _buildDrawerContent(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 24),
      itemCount: widget.navItems.length,
      separatorBuilder: (context, index) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final item = widget.navItems[index];
        final isSelected = item.entry.id == widget.selectedEntry.id;
        return ListTile(
          title: Text(
            item.entry.title,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          contentPadding:
              EdgeInsets.only(left: 16 + item.depth * 16, right: 16),
          selected: isSelected,
          tileColor: Colors.transparent,
          selectedTileColor: AppColors.primary.withOpacity(0.1),
          onTap: () {
            Navigator.of(context).pop();
            widget.onSelect(item.entry);
            setState(() {});
          },
        );
      },
    );
  }
}

class _ManualContentView extends StatelessWidget {
  const _ManualContentView({required this.entry});

  final ManualEntry entry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entry.title,
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          if (entry.hasChildren)
            Column(
              children: entry.children
                  .map(
                    (child) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '•',
                            style: AppTypography.bodyMedium
                                .copyWith(fontWeight: FontWeight.w700),
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
            )
          else
            Text(
              '섹션 콘텐츠를 여기에 작성하세요. 텍스트, 이미지, 표 등을 자유롭게 구성할 수 있습니다.',
              style: AppTypography.bodyMedium,
            ),
        ],
      ),
    );
  }
}
