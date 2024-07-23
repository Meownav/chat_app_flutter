import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isCurrentUser ? Colors.green[400] : Colors.grey[500],
        ),
        child: Text(message),
      ),
    );
  }
}
