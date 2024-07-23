import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary,
        ),
        padding: const EdgeInsets.all(24),
        // margin: const EdgeInsets.symmetric(
        //   horizontal: 8,
        // ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
      ),
    );
  }
}
