import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatBubbleIssuer extends StatelessWidget {
  final Message message;
  const ChatBubbleIssuer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors =
        Theme.of(context).colorScheme; //Obtener colores del tema global

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
