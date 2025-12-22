import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../data/manual_content.dart' as ko;
import '../data/manual_content_en.dart' as en;
import '../data/manual_toc.dart' as ko_toc;
import '../data/manual_toc_en.dart' as en_toc;
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
  late List<ManualNavItem> _navItems;
  late ManualEntry _selectedEntry;
  late String _lang;

  @override
  void initState() {
    super.initState();
    _lang = ko.kAppLang;
    _navItems = _buildNavItems(_tocForLang(_lang));
    _selectedEntry = _navItems.first.entry;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 900;
        final contentList = _contentsForLang(_lang);
        if (isCompact) {
          return _CompactManualPage(
            navItems: _navItems,
            selectedEntry: _selectedEntry,
            onSelect: _onSelect,
            lang: _lang,
            onLangChanged: _onLangChanged,
            contentList: contentList,
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: constraints,
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text('RB X Manual', maxLines: 1),
                  ),
                );
              },
            ),
            actions: [
              _LanguageDropdown(
                value: _lang,
                onChanged: _onLangChanged,
              ),
              const SizedBox(width: 8),
            ],
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
                        content: _findSectionContent(
                          _selectedEntry.id,
                          contentList,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 36),
                        onSelect: _onSelect,
                        emptyContentText: _lang == 'en'
                            ? 'Write the section content here. You can freely compose text, images, tables, etc.'
                            : '섹션 콘텐츠를 여기에 작성하세요. 텍스트, 이미지, 표 등을 자유롭게 구성할 수 있습니다.',
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

  void _onLangChanged(String lang) {
    if (lang == _lang) return;
    setState(() {
      final prevId = _selectedEntry.id;
      _lang = lang;
      _navItems = _buildNavItems(_tocForLang(_lang));
      final matched = _navItems
          .where((i) => i.entry.id == prevId)
          .map((i) => i.entry)
          .toList();
      _selectedEntry =
          matched.isNotEmpty ? matched.first : _navItems.first.entry;
    });
  }

  List<ManualEntry> _tocForLang(String lang) {
    return lang == 'en' ? en_toc.manualTocEn : ko_toc.manualToc;
  }

  List<ManualSectionContent> _contentsForLang(String lang) {
    return lang == 'en'
        ? en.manualSectionContentsEn
        : ko.manualSectionContentsKo;
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

ManualSectionContent? _findSectionContent(
  String entryId,
  List<ManualSectionContent> sections,
) {
  for (final section in sections) {
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
    required this.lang,
    required this.onLangChanged,
    required this.contentList,
  });

  final List<ManualNavItem> navItems;
  final ManualEntry selectedEntry;
  final ValueChanged<ManualEntry> onSelect;
  final String lang;
  final ValueChanged<String> onLangChanged;
  final List<ManualSectionContent> contentList;

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
        title: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: constraints,
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text('RB X Manual', maxLines: 1),
              ),
            );
          },
        ),
        actions: [
          _LanguageDropdown(
            value: widget.lang,
            onChanged: widget.onLangChanged,
          ),
          const SizedBox(width: 8),
        ],
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
        content:
            _findSectionContent(widget.selectedEntry.id, widget.contentList),
        emptyContentText: widget.lang == 'en'
            ? 'Write the section content here. You can freely compose text, images, tables, etc.'
            : '섹션 콘텐츠를 여기에 작성하세요. 텍스트, 이미지, 표 등을 자유롭게 구성할 수 있습니다.',
      ),
    );
  }
}

class _LanguageDropdown extends StatelessWidget {
  const _LanguageDropdown({
    required this.value,
    required this.onChanged,
  });

  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.sizeOf(context).width < 420;
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: isNarrow ? 12 : 14,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isNarrow)
          const Icon(
            Icons.language,
            size: 20,
            color: Colors.white,
          )
        else
          Text(
            'Language',
            style: textStyle,
          ),
        SizedBox(width: isNarrow ? 6 : 12),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isDense: true,
            style: textStyle,
            iconEnabledColor: Colors.white,
            iconSize: isNarrow ? 18 : 24,
            dropdownColor: Colors.black87,
            selectedItemBuilder: isNarrow
                ? (context) => const [
                      Text('KO', style: TextStyle(color: Colors.white)),
                      Text('EN', style: TextStyle(color: Colors.white)),
                    ]
                : null,
            onChanged: (v) {
              if (v == null) return;
              onChanged(v);
            },
            items: const [
              DropdownMenuItem(value: 'ko', child: Text('한국어')),
              DropdownMenuItem(value: 'en', child: Text('English')),
            ],
          ),
        ),
      ],
    );
  }
}
