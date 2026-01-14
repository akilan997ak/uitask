import 'package:flutter/material.dart';
import 'package:untitled/views/signupscreen.dart';
import '../reusable/inputfield.dart';
import '../util/appcolors.dart';
import '../util/images.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final isWatch = maxWidth < 280;

        double cardWidth;
        if (isWatch) {
          cardWidth = maxWidth;
        } else if (maxWidth < 360) {
          cardWidth = maxWidth * 0.95;
        } else if (maxWidth < 600) {
          cardWidth = 380;
        } else {
          cardWidth = 420;
        }

        double scale(double base) =>
            (base * (maxWidth / 375)).clamp(base * 0.75, base);

        return Scaffold(
          body: Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFF1E0), Color(0xFFE6D9FF)],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isWatch ? 8 : 16,
                    vertical: isWatch ? 12 : 24,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: cardWidth),
                    child: Container(
                      padding: EdgeInsets.all(isWatch ? 12 : 24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.white70),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: isWatch ? 48 : 64,
                            width: isWatch ? 48 : 64,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF3FF),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Image.asset(
                                AppImages.shield,
                                height: isWatch ? 22 : 32,
                              ),
                            ),
                          ),

                          SizedBox(height: isWatch ? 12 : 20),

                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: scale(28),
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            'Enter your email and password to log in',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: scale(14),
                              color: Colors.grey,
                            ),
                          ),

                          SizedBox(height: isWatch ? 16 : 24),

                          const AppInputField(hint: 'Email'),

                          const SizedBox(height: 14),

                          const AppInputField(
                            hint: 'Password',
                            obscure: true,
                            suffix: Icon(
                              Icons.visibility_off,
                              size: 18,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8,
                            runSpacing: 4,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(value: false, onChanged: (_) {}),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(fontSize: scale(13)),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontSize: scale(13),
                                    color: AppColors.primarycolor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: isWatch ? 10 : 14),

                          SizedBox(
                            width: double.infinity,
                            height: isWatch ? 44 : 52,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const SignUpScreen());
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: AppColors.primarycolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: scale(16),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: isWatch ? 14 : 20),

                          Row(
                            children: const [
                              Expanded(child: Divider(color: Colors.white70)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Or login with',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Expanded(child: Divider(color: Colors.white70)),
                            ],
                          ),

                          SizedBox(height: isWatch ? 12 : 18),

                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            alignment: WrapAlignment.center,
                            children: const [
                              _SocialIcon(AppImages.google),
                              _SocialIcon(AppImages.facebook),
                              _SocialIcon(AppImages.apple),
                              _SocialIcon(AppImages.phone),
                            ],
                          ),

                          SizedBox(height: isWatch ? 16 : 24),

                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                "Don’t have an account? ",
                                style: TextStyle(fontSize: scale(13)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const SignUpScreen());
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: scale(13),
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
      },
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final String asset;
  const _SocialIcon(this.asset);

  @override
  Widget build(BuildContext context) {
    final isWatch = MediaQuery.of(context).size.width < 280;

    return Container(
      height: isWatch ? 40 : 48,
      width: isWatch ? 48 : 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
        ],
      ),
      child: Center(child: Image.asset(asset, height: isWatch ? 18 : 22)),
    );
  }
}
