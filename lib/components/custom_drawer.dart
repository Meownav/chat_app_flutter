import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/pages/settings_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Theme.of(context).colorScheme.inverseSurface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Drawer Header
              Theme(
                data: Theme.of(context).copyWith(
                  dividerTheme:
                      const DividerThemeData(color: Colors.transparent),
                ),
                child: DrawerHeader(
                  child: Icon(
                    Icons.message,
                    size: 64,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              // Drawer Home
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: ListTile(
                  title: const Padding(
                    padding: EdgeInsets.only(),
                    child: Text(
                      "H O M E",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  leading: const Icon(
                    Icons.home,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              // Drawer Settings
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  top: 8,
                ),
                child: ListTile(
                  title: const Padding(
                    padding: EdgeInsets.only(),
                    child: Text(
                      "S E T T I N G S",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  leading: const Icon(
                    Icons.settings,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ));
                  },
                ),
              ),
              // Drawer Logout
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 24,
            ),
            child: ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(),
                child: Text(
                  "L O G O U T",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              leading: const Icon(
                Icons.logout_outlined,
              ),
              onTap: logout,
            ),
          )
        ],
      ),
    );
  }
}
