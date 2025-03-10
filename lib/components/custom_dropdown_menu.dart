import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List<DropdownMenuEntry<String>> items;
  final void Function(String?)? onSelected;
  final String label;

  const CustomDropdownMenu({
    super.key,
    required this.items,
    required this.label,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      enableSearch: true,
      enableFilter: true,
      dropdownMenuEntries: items,
      onSelected: onSelected,
      label: Text(label),
      width: 330,
    );
  }
}
