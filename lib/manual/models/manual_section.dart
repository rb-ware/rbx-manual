import 'package:flutter/foundation.dart';

@immutable
class ManualEntry {
  const ManualEntry({
    required this.id,
    required this.title,
    this.children = const <ManualEntry>[],
  });

  final String id;
  final String title;
  final List<ManualEntry> children;

  bool get hasChildren => children.isNotEmpty;
}
