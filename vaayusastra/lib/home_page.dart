import 'package:flutter/material.dart';
import 'about_us_page.dart';
import 'dashboard_page.dart';
import 'more_page.dart';
import 'login_page.dart'; // Import LoginPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    AboutUsPage(),
    DashboardPage(),
  ];

  void onTabTapped(int index) {
    if (index < _children.length) {
      setState(() {
        _currentIndex = index;
      });
    } else {
      // Navigate to the MorePage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MorePage()),
      );
    }
  }

  void _logout() async {
    // Navigate to the login page and replace all routes
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.blueGrey[700],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100),
            Text(
              'Welcome to the Home Page!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Card(
              color: Colors.yellow,
              child: ListTile(
                title: Text(
                  'Learn Flutter',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Build beautiful native apps',
                  style: TextStyle(color: Colors.black54),
                ),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
                onTap: () {
                  // Navigate to a detailed Flutter course page
                },
              ),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.yellow,
              child: ListTile(
                title: Text(
                  'Master React',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Create interactive UIs',
                  style: TextStyle(color: Colors.black54),
                ),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
                onTap: () {
                  // Navigate to a detailed React course page
                },
              ),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.yellow,
              child: ListTile(
                title: Text(
                  'Explore Python',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Unlock the power of automation',
                  style: TextStyle(color: Colors.black54),
                ),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
                onTap: () {
                  // Navigate to a detailed Python course page
                },
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Our Top Courses',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CourseCard(
                    title: 'Flutter Development',
                    color: Colors.yellow,
                    onTap: () {
                      // Navigate to a detailed Flutter course page
                    },
                  ),
                  CourseCard(
                    title: 'React Development',
                    color: Colors.yellow,
                    onTap: () {
                      // Navigate to a detailed React course page
                    },
                  ),
                  CourseCard(
                    title: 'Python Programming',
                    color: Colors.yellow,
                    onTap: () {
                      // Navigate to a detailed Python course page
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
}

class CourseCard extends StatelessWidget {
  final String title;
  final Color color;
  final Function() onTap;

  CourseCard({required this.title, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Learn More',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
