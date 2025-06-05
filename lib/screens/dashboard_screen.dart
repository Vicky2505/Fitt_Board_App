import 'package:fitt_board/screens/add_slot_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/greeting_header.dart';
import '../widgets/today_bookings.dart';
import '../widgets/earnings_card.dart';
import '../widgets/upcoming_slot.dart';
import '../widgets/profile_status.dart';
import '../widgets/notification_bell.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 4,
        centerTitle: true,
        title: Text(
          'Dashboard',
          style: theme.textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: NotificationBell(),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          double horizontalPadding = 20;
          double verticalPadding = 24;
          double sectionSpacing = 24;
          double topContainerPadding = 20;
          double topContainerHeight = 100;
          double greetingFontSize = 20;
          double sectionTitleFontSize = 18;
          double sectionIconSize = 26;
          double buttonFontSize = 16;
          double buttonVerticalPadding = 14;
          BorderRadius buttonBorderRadius = BorderRadius.circular(30);

          if (width > 600) {
            horizontalPadding = 40;
            verticalPadding = 32;
            sectionSpacing = 32;
            topContainerPadding = 30;
            topContainerHeight = 140;
            greetingFontSize = 28;
            sectionTitleFontSize = 22;
            sectionIconSize = 32;
            buttonFontSize = 20;
            buttonVerticalPadding = 18;
            buttonBorderRadius = BorderRadius.circular(40);
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: topContainerHeight,
                  padding: EdgeInsets.all(topContainerPadding),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.deepPurple.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: topContainerHeight - topContainerPadding * 2,
                        width:
                            (topContainerHeight - topContainerPadding * 2) *
                            1.1,
                        child: Lottie.asset(
                          'images/lottie_effects/hello_effect.json',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: horizontalPadding / 2),
                      Flexible(
                        child: DefaultTextStyle.merge(
                          style: TextStyle(fontSize: greetingFontSize),
                          child: const GreetingHeader(userName: "Ayush"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: sectionSpacing),
                _buildSectionCard(
                  child: const TodayBookings(),
                  title: "Today's Bookings",
                  icon: Icons.calendar_today_outlined,
                  color: Colors.deepPurple,
                  titleFontSize: sectionTitleFontSize,
                  iconSize: sectionIconSize,
                ),
                SizedBox(height: sectionSpacing),
                _buildSectionCard(
                  child: const EarningsCard(amount: "₹5,200"),
                  title: "Earnings This Week",
                  icon: Icons.attach_money_outlined,
                  color: Colors.deepPurple,
                  titleFontSize: sectionTitleFontSize,
                  iconSize: sectionIconSize,
                ),
                SizedBox(height: sectionSpacing),
                _buildSectionCard(
                  child: const UpcomingSlot(time: "5:00 PM - Yoga with Rahul"),
                  title: "Upcoming Slot",
                  icon: Icons.schedule_outlined,
                  color: Colors.deepPurple,
                  titleFontSize: sectionTitleFontSize,
                  iconSize: sectionIconSize,
                ),
                SizedBox(height: sectionSpacing),
                _buildSectionCard(
                  child: const ProfileStatus(status: "Verified"),
                  title: "Profile Status",
                  icon: Icons.verified_user_outlined,
                  color: Colors.deepPurple,
                  titleFontSize: sectionTitleFontSize,
                  iconSize: sectionIconSize,
                ),
                SizedBox(height: sectionSpacing + 12),
                SizedBox(
                  width: double.infinity,
                  child:
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.add,
                          size: 24,
                          color: Colors.white,
                        ),
                        label: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: buttonVerticalPadding,
                          ),
                          child: Text(
                            "Add New Slot",
                            style: TextStyle(
                              fontSize: buttonFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: buttonBorderRadius,
                          ),
                          elevation: 6,
                          shadowColor: Colors.deepPurpleAccent,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddSlotScreen(),
                            ),
                          );
                        },
                      ).wrapWithGradient(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: buttonBorderRadius,
                      ),
                ),
                SizedBox(height: sectionSpacing + 12),
              ],
            ),
          );
        },
      ),
    );
  }

  // build section cards
  Widget _buildSectionCard({
    required Widget child,
    required String title,
    required IconData icon,
    required Color color,
    double titleFontSize = 18,
    double iconSize = 26,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: color.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: iconSize),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

// gradient background
extension GradientButtonExtension on Widget {
  Widget wrapWithGradient({
    required Gradient gradient,
    BorderRadius? borderRadius,
  }) {
    return Container(
      decoration: BoxDecoration(gradient: gradient, borderRadius: borderRadius),
      child: this,
    );
  }
}
