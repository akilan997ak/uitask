import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/util/appcolors.dart';
import 'package:untitled/util/images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmall = constraints.maxWidth < 360;
        final double padding = isSmall ? 14 : 20;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Good Afternoon,\n',
                        style: GoogleFonts.poppins(
                          fontSize: isSmall ? 22 : 26,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF3B1D3F),
                          height: 1.3,
                        ),
                      ),
                      TextSpan(
                        text: 'Sarina!',
                        style: GoogleFonts.poppins(
                          fontSize: isSmall ? 22 : 26,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF3B1D3F),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Text(
                  'How are you feeling today ?',
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 92,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  scrollDirection: Axis.horizontal,
                  children: [
                    MoodCard('Happy', AppImages.smiley, Color(0xFFFF5DA2)),
                    MoodCard('Calm', AppImages.relax, Color(0xFF9FA8FF)),
                    MoodCard('Manic', AppImages.sumo, Color(0xFF8FE3D4)),
                    MoodCard('Angry', AppImages.angry, Color(0xFFFFA65C)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF2E5),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1 on 1 Sessions',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Let’s open up to the things that matter the most',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Book Now',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFF8A00),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.calendar_today,
                                  color: AppColors.secondarycolor,
                                  size: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        AppImages.meetup,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Row(
                  children: [
                    Expanded(
                      child: ActionCard(
                        image: AppImages.journal,
                        label: 'Journal',
                        isSmall: isSmall,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: ActionCard(
                        image: AppImages.doc,
                        label: 'Library',
                        isSmall: isSmall,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F6F6),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '“It is better to conquer yourself than to win a thousand battles”',
                          style: GoogleFonts.poppins(
                            fontSize: isSmall ? 13 : 14,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.format_quote_rounded,
                        size: 28,
                        color: Colors.black.withValues(alpha: 0.25),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),
              Container(
                height: 150,
                padding: EdgeInsets.symmetric(horizontal: padding),
                width: Get.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        color: const Color(0xFF53A06E),
                      ),

                      Positioned(
                        bottom: -40,
                        right: -20,
                        child: Transform.rotate(
                          angle: -0.2,
                          child: Container(
                            height: 60,
                            width: 250,
                            decoration: const BoxDecoration(
                              color: Color(0xFF73B78B),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(80),
                                topRight: Radius.circular(80),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Plan Expired',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Get back chat access and\nsession credits',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        'Buy More',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      const Icon(
                                        Icons.arrow_forward_rounded,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Image.asset(
                              AppImages.flower,
                              height: 80,
                              width: 80,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}

class MoodCard extends StatelessWidget {
  final String title;
  final String icon;
  final Color color;

  const MoodCard(this.title, this.icon, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(child: Image.asset(icon, height: 30)),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black26,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final String image;
  final String label;
  final bool isSmall;

  const ActionCard({
    super.key,
    required this.image,
    required this.label,
    required this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isSmall ? 16 : 18,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F6F6),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 25, width: 25),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
