import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Text
            const Text(
              "Hello, Players!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Welcome back to your dashboard. Here's what's happening today:",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            // Quick Action Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildDashboardCard(
                    icon: Icons.event,
                    title: "Matches Schedules",
                    onTap: () {
                      // Navigate to Matches screen
                      print("Upcoming Matches tapped");
                    },
                  ),
                  _buildDashboardCard(
                    icon: Icons.history,
                    title: "Match History",
                    onTap: () {
                      // Navigate to Match History screen
                      print("Match History tapped");
                    },
                  ),
                  _buildDashboardCard(
                    icon: Icons.group,
                    title: "Your Teams",
                    onTap: () {
                      // Navigate to Teams screen
                      print("Your Teams tapped");
                    },
                  ),
                  _buildDashboardCard(
                    icon: Icons.settings,
                    title: "Settings",
                    onTap: () {
                      // Navigate to Settings screen
                      print("Settings tapped");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
