import 'package:flutter/material.dart';
import 'level1.dart'; // Import Level1DetailPage
import 'level2.dart'; // Import Level2DetailPage
import 'level3.dart'; // Import Level3DetailPage
import 'level4.dart'; // Import Level4DetailPage

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text('Dashboard'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, User!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildLevelItem(context, 'Level 1', Icons.folder, Colors.yellow),
                  _buildLevelItem(context, 'Level 2', Icons.folder, Colors.yellow),
                  _buildLevelItem(context, 'Level 3', Icons.folder, Colors.yellow),
                  _buildLevelItem(context, 'Level 4', Icons.folder, Colors.yellow),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelItem(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          // Navigate to respective LevelDetailPage based on title
          switch (title) {
            case 'Level 1':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Level1DetailPage()),
              );
              break;
            case 'Level 2':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Level2DetailPage()),
              );
              break;
            case 'Level 3':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Level3DetailPage()),
              );
              break;
            case 'Level 4':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Level4DetailPage()),
              );
              break;
            default:
              // Do nothing
              break;
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: Colors.yellow,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
