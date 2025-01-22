import 'package:flutter/material.dart';

class RefreshButton extends StatefulWidget {
  final VoidCallback function;
  const RefreshButton({super.key, required this.function});

  @override
  State<RefreshButton> createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Color.fromARGB(152, 111, 198, 112),
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: Offset(2, 5))
      ], borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        onPressed: () {
          widget.function();
        },
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor:
              const WidgetStatePropertyAll(Color.fromARGB(233, 117, 194, 118)),
          fixedSize: const WidgetStatePropertyAll(Size(200, 50)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), side: BorderSide.none),
          ),
        ),
        child: const Center(
          child: Text(
            'Занова',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
