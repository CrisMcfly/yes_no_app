import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatBubbleReceiver extends StatelessWidget {
  final Message message;
  const ChatBubbleReceiver({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors =
        Theme.of(context).colorScheme; //Obtener colores del tema global

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _ChatBubbleImage(message.imageUrl!),
        const SizedBox(height: 10),
        //Todo: IMAGEN
      ],
    );
  }
}

class _ChatBubbleImage extends StatelessWidget {
  final String imageUrl;
  const _ChatBubbleImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.70,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.70,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: const Text('LOADING....'),
          );
        },
      ),
    );
  }
}
