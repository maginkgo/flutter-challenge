import 'package:flutter/material.dart';

class LabelField extends StatelessWidget {
  static const _bold = const TextStyle(fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
          children: [
            const TextSpan(text: 'Input '),
            const TextSpan(text: 'name ', style: _bold),
            const TextSpan(text: 'or '),
            const TextSpan(text: 'symbol ', style: _bold),
            const TextSpan(text: 'to add a new coin'),
          ],
        ),
      ),
    );
  }
}
