import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/views/loginscreen.dart';
import '../reusable/inputfield.dart';
import '../util/appcolors.dart';
import 'dashboardscreen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWatch = size.width < 300;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF1E0), Color(0xFFE6D9FF)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isWatch ? 12 : 20),
                child: Container(
                  padding: EdgeInsets.all(isWatch ? 14 : 24),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white70),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _header(isWatch),
                      const SizedBox(height: 20),

                      AppInputField(hint: 'First Name'),
                      const SizedBox(height: 12),

                      AppInputField(hint: 'Last Name'),
                      const SizedBox(height: 12),

                      AppInputField(hint: 'Email'),
                      const SizedBox(height: 12),

                      AppInputField(
                        hint: 'Date of Birth',
                        suffix: const Icon(Icons.calendar_month, size: 18),
                      ),
                      const SizedBox(height: 12),

                      _phoneInput(),
                      const SizedBox(height: 12),

                      AppInputField(
                        hint: 'Password',
                        obscure: true,
                        suffix: const Icon(Icons.visibility_off, size: 18),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: isWatch ? 44 : 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => MainScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primarycolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(fontSize: 13),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => LoginScreen());
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primarycolor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(bool isWatch) {
    return Column(
      children: [
        Text(
          'Sign Up',
          style: TextStyle(
            fontSize: isWatch ? 20 : 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Create an account to continue!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _phoneInput() {
    return Row(
      children: [
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(child: Text('🇺🇸 +1')),
        ),
        const SizedBox(width: 8),
        Expanded(child: AppInputField(hint: 'Phone number')),
      ],
    );
  }
}
