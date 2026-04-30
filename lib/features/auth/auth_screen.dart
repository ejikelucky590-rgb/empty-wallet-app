import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _toggleAuthMode() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  Future<void> _handleAuth() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    try {
      if (isLogin) {
        await _authService.login(_emailController.text.trim(), _passwordController.text.trim());
      } else {
        await _authService.signUp(_emailController.text.trim(), _passwordController.text.trim());
      }
      // Navigation logic to Main Shell goes here after Firebase check
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: DoveColors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "DOVE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.black,
                    letterSpacing: 10,
                    color: DoveColors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  isLogin ? "WELCOME BACK" : "CREATE ACCOUNT",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: DoveColors.cyan,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 60),
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: DoveColors.white),
                  decoration: const InputDecoration(labelText: "EMAIL"),
                  validator: (v) => v!.contains('@') ? null : "INVALID EMAIL",
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(color: DoveColors.white),
                  decoration: const InputDecoration(labelText: "PASSWORD"),
                  obscureText: true,
                  validator: (v) => v!.length < 6 ? "TOO SHORT" : null,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: isLoading ? null : _handleAuth,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DoveColors.white,
                    foregroundColor: DoveColors.black,
                    disabledBackgroundColor: DoveColors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  child: isLoading 
                    ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: DoveColors.black, strokeWidth: 2))
                    : Text(isLogin ? "LOG IN" : "SIGN UP", style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: _toggleAuthMode,
                  child: Text(
                    isLogin ? "NEW ARTIST? JOIN HERE" : "ALREADY A MEMBER? LOGIN",
                    style: const TextStyle(color: DoveColors.grey, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
