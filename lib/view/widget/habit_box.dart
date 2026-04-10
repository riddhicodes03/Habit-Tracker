import 'package:flutter/material.dart';

class HabitBox extends StatelessWidget {
  const HabitBox({
    super.key,
    required this.onChange,
    required this.isChecked,
    required this.title,
  });
  final bool isChecked;
  final String title;
  final void Function(bool?) onChange;

  @override
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: scheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isChecked
              ? scheme.primary.withValues(alpha: 0.6)
              : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        children: [
          /// ✅ Modern Checkbox
          Transform.scale(
            scale: 1.4,
            child: Checkbox(value: isChecked, onChanged: onChange),
          ),

          const SizedBox(width: 12),

          /// 📝 Title + Subtitle
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                decoration: isChecked ? TextDecoration.lineThrough : null,
                color: isChecked
                    ? scheme.primary.withValues(alpha: 0.1)
                    : scheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
