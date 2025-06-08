import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final ChipThemeData chipTheme;
  const CustomFilterChip(
      {super.key,
      required this.label,
      required this.selected,
      required this.onTap,
      required this.chipTheme});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        label,
        style: selected ? chipTheme.secondaryLabelStyle : chipTheme.labelStyle,
      ),
      selected: selected,
      selectedColor: chipTheme.selectedColor,
      backgroundColor: chipTheme.backgroundColor,
      shape: chipTheme.shape,
      onSelected: (_) => onTap(),
    );
  }
}
