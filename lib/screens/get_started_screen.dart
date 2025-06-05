import 'package:fitt_board/widgets/carousel_showcase.dart';
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          double headlineFontSize = 28;
          double bodyFontSize = 16;
          double buttonFontSize = 18;
          double horizontalPadding = 32;
          double topSpacing = 40;
          double carouselHeight = height * 0.5;

          if (width > 600) {
            headlineFontSize = 36;
            bodyFontSize = 20;
            buttonFontSize = 22;
            horizontalPadding = 64;
            topSpacing = 60;
            carouselHeight = height * 0.6;
          }

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: topSpacing),
                  SizedBox(
                    height: carouselHeight,
                    child: const CarouselShowcase(),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Welcome to FittBoard!',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: headlineFontSize,
                          ),
                        ),
                        SizedBox(height: topSpacing / 2),
                        Text(
                          'Your trainer dashboard starts here. Ready to boost your schedule?',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                            fontSize: bodyFontSize,
                          ),
                        ),
                        SizedBox(height: topSpacing),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 4,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DashboardScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Get Started',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: const Color(0xFF4A00E0),
                                fontWeight: FontWeight.bold,
                                fontSize: buttonFontSize,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: topSpacing),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
