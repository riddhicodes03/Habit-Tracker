import 'package:flutter/material.dart';

class HabitBox extends StatelessWidget {
  const HabitBox({
    super.key,
    required this.title,
    required this.streakText,
    required this.isChecked,
    required this.onChange,
    required this.icon,
    required this.iconColor,
  });

  final String title;
  final String streakText;
  final bool isChecked;
  final void Function(bool?) onChange;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: scheme.surfaceContainer, // dark blue background
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          width: 1.5,
          color: isChecked
              ? scheme.surfaceContainerHigh
              : scheme.surfaceContainer,
        ),
      ),

      child: Row(
        children: [
          /// 🔥 Left Icon Box
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),

          const SizedBox(width: 14),

          /// 📝 Title + Streak
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  streakText,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),

          /// ✅ Right Checkbox (custom circle style)
          GestureDetector(
            onTap: () => onChange(!isChecked),
            child: Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked ? Colors.green : Colors.transparent,
                border: Border.all(
                  color: isChecked
                      ? Colors.green
                      : Colors.white.withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
              child: isChecked
                  ? const Icon(Icons.check, size: 16, color: Colors.black)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
