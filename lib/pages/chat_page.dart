import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/components/custom_textfield.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverId;
  final TextEditingController _msgController = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverId,
  });

  void sendMessage() async {
    if (_msgController.text.isNotEmpty) {
      await _chatService.sendMsg(receiverId, _msgController.text);
      _msgController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[700],
          title: Text(receiverEmail),
        ),
        body: Column(
          children: [Expanded(child: _buildMessageList()), _buildUserInput()],
        ));
  }

  Widget _buildMessageList() {
    String senderId = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverId, senderId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data["senderId"] == _authService.getCurrentUser()!.uid;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data["message"], isCurrentUser: isCurrentUser)
          ],
        ));
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: CustomTextfield(
              controller: _msgController,
              hintText: "Type a message...",
              obscureText: false,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.circular(40),
            ),
            margin: const EdgeInsets.only(left: 4),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(Icons.arrow_upward),
              color: Colors.white,
              iconSize: 36,
            ),
          ),
        ],
      ),
    );
  }
}
