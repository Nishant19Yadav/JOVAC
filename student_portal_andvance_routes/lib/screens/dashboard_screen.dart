import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class DashboardScreen extends StatelessWidget {
  final String userName = 'John Doe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Illustration
            Container(
              height: 200,
              child: Image.network(
                'https://public-files.gumroad.com/r5bhp20yvxll56z4g6ugsbrwu4pn',
              ),
            ),
            SizedBox(height: 20),

            // Welcome Message
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back,',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  Text(
                    '$userName 👋',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.brown.shade800),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Feature Cards
            _buildDashboardCard(
              context,
              title: 'View Profile',
              subtitle: 'See and edit your personal information.',
              icon: Icons.person_outline,
              color: Colors.brown,
              onTap: () => Navigator.pushNamed(context, AppRoutes.profile),//'/profile'
            ),
            SizedBox(height: 16),
            _buildDashboardCard(
              context,
              title: 'View Courses',
              subtitle: 'Continue learning or explore new topics.',
              icon: Icons.menu_book_outlined,
              color: Colors.brown.shade700,
              onTap: () => Navigator.pushNamed(context, AppRoutes.courses),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context,
      {required String title,
        required String subtitle,
        required IconData icon,
        required Color color,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              radius: 30,
              child: Icon(icon, size: 30, color: color),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown.shade900)),
                  SizedBox(height: 6),
                  Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.brown.shade300),
          ],
        ),
      ),
    );
  }
}