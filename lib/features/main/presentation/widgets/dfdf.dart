import 'package:flutter/material.dart';

class ContainerButtom extends StatelessWidget {
  const ContainerButtom({
    super.key,
    required this.text,
    required this.color,
    required this.width,
  });

  final String text;
  final Color color;
  final Size width;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 90,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ],
    );
  }
}
