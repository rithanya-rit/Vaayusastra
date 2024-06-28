import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart'; // Import your login page
import 'onboarding_page.dart'; // Import your onboarding page

class OnboardingNavigator extends StatefulWidget {
  @override
  _OnboardingNavigatorState createState() => _OnboardingNavigatorState();
}

class _OnboardingNavigatorState extends State<OnboardingNavigator> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _navigateToNext() {
    if (_currentPage < 2) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _skipOnboarding() {
    _finishOnboarding();
  }

  Future<void> _finishOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('firstSeen', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            onPageChanged: _onPageChanged,
            children: <Widget>[
              OnboardingPage(
                image: 'assets/flash.jpeg',
                title: 'Welcome to Vaayusastra App!',
                description: 'Explore science and discover new horizons.',
              ),
              OnboardingPage(
                image: 'assets/onboarding2.jpeg',
                title: 'Discover Courses',
                description: 'Advance skills in aeronautics and aerospace.',
              ),
              OnboardingPage(
                image: 'assets/onboarding3.jpeg',
                title: 'Get Started',
                description: 'Join Vaayusastra and start your journey.',
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < 3; i++)
                  if (i == _currentPage)
                    _buildPageIndicator(true)
                  else
                    _buildPageIndicator(false)
              ],
            ),
          ),
          if (_currentPage != 2)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: _skipOnboarding,
                    child: Text('Skip', style: TextStyle(color: Colors.yellow)),
                  ),
                  ElevatedButton(
                    onPressed: _navigateToNext,
                    child: Text('Next'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                ],
              ),
            )
          else
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: _finishOnboarding,
                  child: Text('Get Started'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isCurrentPage ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.yellow : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
