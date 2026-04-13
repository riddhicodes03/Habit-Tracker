import 'package:flutter/material.dart';

class AddWaterButton extends StatelessWidget {
  const AddWaterButton({super.key, required this.amount, required this.onTap});
  final int amount;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 30,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),

        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        '+ $amount ml',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
