import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_quiz/view/auth/admin_password.dart';
import 'package:smart_quiz/view/auth/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildRoleButton(String label, IconData icon, VoidCallback onTap) {
    return Expanded(
      child:
          ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.15),
                  side: const BorderSide(color: Colors.white, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 18,
                  ),
                  elevation: 0,
                ),
                onPressed: onTap,
                icon: Icon(icon, color: Colors.white, size: 26),
                label: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: const Duration(milliseconds: 900))
              .slideY(begin: 0.3, end: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // Gradient background for modern feel
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A5AE0), Color(0xFF9B69D5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Quiz Icon
                Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Icon(
                        Icons.quiz_outlined,
                        size: 200,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 800))
                    .scale(
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1, 1),
                    ),

                const SizedBox(height: 120),

                // Title
                Text(
                      'Welcome to Smart Quiz',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.95),
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 1000))
                    .slideY(begin: 0.3, end: 0),

                const SizedBox(height: 18),

                // Subtitle
                Text(
                      'Select your role to begin your smart quiz journey!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: size.width * 0.040,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 1200))
                    .slideY(begin: 0.3, end: 0),

                const SizedBox(height: 70),

                // Role Buttons (Responsive Row)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRoleButton("Admin", Icons.admin_panel_settings, () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdminPassword(),
                        ),
                      );
                    }),
                    const SizedBox(width: 12),
                    _buildRoleButton("User", Icons.person, () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
