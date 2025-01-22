import 'package:flutter/material.dart';

class RefreshIconButton extends StatelessWidget {
  const RefreshIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.refresh),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) => states.contains(WidgetState.pressed)
              ? const Color.fromARGB(221, 181, 181, 181)
              : const Color.fromARGB(255, 219, 219, 219),
        ),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
            (Set<WidgetState> states) => states.contains(WidgetState.pressed)
                ? const CircleBorder(side: BorderSide.none)
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide.none)),
      ),
    );
  }
}
