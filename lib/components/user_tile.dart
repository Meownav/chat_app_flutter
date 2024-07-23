import 'package:flutter/material.dart';

class Usertile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const Usertile({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 24,
        ),
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
