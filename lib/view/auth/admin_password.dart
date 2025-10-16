import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_quiz/theme/theme.dart';
import 'package:smart_quiz/view/admin/admin_home_screen.dart';
import 'package:smart_quiz/view/auth/welcome_screen.dart';

class AdminPassword extends StatefulWidget {
  const AdminPassword({super.key});

  @override
  State<AdminPassword> createState() => _AdminPasswordState();
}

class _AdminPasswordState extends State<AdminPassword> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool isLoading = false;

  // Set your manual admin password here
  final String _adminPassword = "admin123";

  void _checkPassword() {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      Future.delayed(const Duration(seconds: 1), () {
        setState(() => isLoading = false);

        if (_passwordController.text == _adminPassword) {
          // Password correct, navigate to Admin dashboard
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Password Correct! Redirecting..."),
              backgroundColor: Colors.green,
            ),
          );
          // TODO: Navigate to Admin Home Screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => AdminHomeScreen()),
          );
        } else {
          // Password incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Incorrect Password! Try Again."),
              backgroundColor: Colors.red,
            ),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body:
          SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          "assets/images/use.png",
                          width: size.width * 0.6,
                          height: size.height * 0.3,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Admin Dashboard",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Enter Password to access admin dashboard",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textSecondaryColor,
                        ),
                      ),
                      const SizedBox(height: 50),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          prefixIcon: Icon(
                            Icons.admin_panel_settings,
                            color: AppTheme.primaryColor,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Please Enter Password" : null,
                      ),
                      const SizedBox(height: 35),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          onPressed: isLoading ? null : _checkPassword,
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "GO TO DASHBOARD",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Text(
                          "OR",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textSecondaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Select Again Role?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textSecondaryColor,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WelcomeScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Go Back",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .animate(delay: const Duration(milliseconds: 300))
              .slideY(
                begin: 0.5,
                end: 0,
                duration: const Duration(milliseconds: 300),
              )
              .fadeIn(),
    );
  }
}
