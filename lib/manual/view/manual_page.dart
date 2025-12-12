import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../data/manual_content.dart';
import '../data/manual_toc.dart';
import '../models/manual_content.dart';
import '../models/manual_section.dart';
import 'widgets/manual_content.dart';
import 'widgets/manual_navigation.dart';
import 'widgets/manual_pager.dart';

class ManualPage extends StatefulWidget {
  const ManualPage({super.key});

  @override
  State<ManualPage> createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
  late final List<ManualNavItem> _navItems;
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
              SizedBox(
                width: 300,
                child: ManualNavigation(
                  items: _navItems,
                  selectedEntry: _selectedEntry,
                  onSelect: _onSelect,
                ),
              ),
              const VerticalDivider(width: 1, thickness: 1),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ManualContentView(
                        entry: _selectedEntry,
                        content: _findSectionContent(_selectedEntry.id),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 36),
                        onSelect: _onSelect,
                      ),
                    ),
                    Builder(builder: (context) {
                      final idx = _navItems
                          .indexWhere((i) => i.entry.id == _selectedEntry.id);
                      final ManualEntry? prev =
                          idx > 0 ? _navItems[idx - 1].entry : null;
                      final ManualEntry? next =
                          idx >= 0 && idx < _navItems.length - 1
                              ? _navItems[idx + 1].entry
                              : null;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        child: ManualPagerFooter(
                          prev: prev,
                          next: next,
                          onSelect: _onSelect,
                        ),
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onSelect(ManualEntry entry) {
    setState(() {
      _selectedEntry = entry;
    });
  }

  List<ManualNavItem> _buildNavItems(List<ManualEntry> entries,
      {int depth = 0}) {
    final items = <ManualNavItem>[];
    for (final entry in entries) {
      items.add(ManualNavItem(entry: entry, depth: depth));
      if (entry.children.isNotEmpty) {
        items.addAll(_buildNavItems(entry.children, depth: depth + 1));
      }
    }
    return items;
  }
}

ManualSectionContent? _findSectionContent(String entryId) {
  for (final section in manualSectionContents) {
    if (section.entryId == entryId) {
      return section;
    }
  }
  return null;
}

class _CompactManualPage extends StatefulWidget {
  const _CompactManualPage({
    required this.navItems,
    required this.selectedEntry,
    required this.onSelect,
  });

  final List<ManualNavItem> navItems;
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
        child: SafeArea(
          child: ManualNavigation(
            items: widget.navItems,
            selectedEntry: widget.selectedEntry,
            onSelect: (entry) {
              Navigator.of(context).pop();
              widget.onSelect(entry);
              setState(() {});
            },
          ),
        ),
      ),
      body: ManualContentView(
        entry: widget.selectedEntry,
        content: _findSectionContent(widget.selectedEntry.id),
      ),
    );
  }
}
