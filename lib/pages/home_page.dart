import 'package:chat_app/components/custom_drawer.dart';
import 'package:chat_app/components/user_tile.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[700],
        title: const Text(
          "Home",
        ),
      ),
      drawer: const CustomDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error!");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }
          return ListView(
              children: snapshot.data!
                  .map<Widget>(
                      (userData) => _buildUserListItem(userData, context))
                  .toList());
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return Usertile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverId: userData["uid"],
              ),
            ),
          );
          // print("hi");
        },
      );
    } else {
      return Container();
    }
  }
}
