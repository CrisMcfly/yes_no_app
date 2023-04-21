import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/chat_message_bubble_issuer.dart';
import 'package:yes_no_app/presentation/widgets/chat/chat_message_bubble_receiver.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://z-p3-scontent.fscl19-1.fna.fbcdn.net/v/t39.30808-6/322459703_1395798994555866_7452141324333111305_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeE8K6f4SFzY8DIpVbw0otp_G992zghkz7gb33bOCGTPuDGhDsbCvXPWSEisR1gEiO9pC3nCW_QleCwzjKAN2s9S&_nc_ohc=ZzWMrh880NIAX_kM2HH&_nc_zt=23&_nc_ht=z-p3-scontent.fscl19-1.fna&oh=00_AfB7Pc4kIM1UcLoJjC4Cegtt-nsMRU7MndBJNfMrvTgkSw&oe=644797DB'),
          ),
        ),
        title: const Text('Criss'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                reverse: false,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.receiver)
                      ? ChatBubbleReceiver(
                          message: message,
                        )
                      : ChatBubbleIssuer(
                          message: message,
                        );
                },
              ),
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
