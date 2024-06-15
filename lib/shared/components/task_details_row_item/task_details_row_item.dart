import 'package:flutter/material.dart';

class TaskDetailsRowItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const TaskDetailsRowItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(icon),
        const SizedBox(
          width: 15.0,
        ),
        Flexible(
          child: Text(
            text,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
