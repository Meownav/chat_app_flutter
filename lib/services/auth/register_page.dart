import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/custom_button.dart';
import 'package:chat_app/components/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;

  void register(BuildContext context) {
    final auth = AuthService();
    try {
      auth.signUpWithEmailPass(_emailController.text, _passwordController.text);
    } catch (err) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            err.toString(),
          ),
        ),
      );
    }
  }

  RegisterPage({
    super.key,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Icon(
                Icons.chat,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 48),

              // Welcome Back
              Text(
                "Let's create an account for you.",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 28),

              // Email
              CustomTextfield(
                hintText: "Email",
                obscureText: false,
                controller: _emailController,
              ),

              const SizedBox(height: 8),

              // Password
              CustomTextfield(
                hintText: "Password",
                obscureText: true,
                controller: _passwordController,
              ),

              const SizedBox(height: 16),

              // Login button
              CustomButton(
                buttonText: "Register",
                onTap: () => register(context),
              ),

              // Register
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already registered? ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Login Now!",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
