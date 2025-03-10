import 'package:flutter/material.dart';

class WrapOfChips extends StatelessWidget {
  final List<String> chips;
  final List<String> selectedGenres;
  final void Function(String, bool)? onSelected;

  const WrapOfChips({
    super.key,
    required this.chips,
    required this.selectedGenres,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0,
      children: chips.map((genre) {
        return FilterChip(
          label: Text(genre),
          selected: selectedGenres.contains(genre),
          onSelected: (selected) {
            if (onSelected != null) {
              onSelected!(genre, selected);
            }
          },
          selectedColor: Colors.deepPurple,
          checkmarkColor: Colors.white,
        );
      }).toList(),
    );
  }
}
