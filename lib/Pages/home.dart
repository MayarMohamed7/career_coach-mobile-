import 'package:flutter/material.dart';
import 'package:career_coach/Pages/chat.dart';
import 'package:career_coach/Pages/profileUser.dart';
import 'package:career_coach/Pages/CoachesPage.dart';
import 'package:career_coach/Pages/menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageList = [
    'assets/images/one.png',
    'assets/images/two.png',
    'assets/images/three.png',
    'assets/images/four.png',
  ];

  int _currentPage = 0;
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ChatScreen(),
    ProfilePageUser(),
    ProfilePageUser(), // Placeholder for Account page
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePageUser()),
      );
    }
    else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CoachesPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F4F6C),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/NiceJob.png',
              height: 120,
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255), // Change color to navy blue
          child: DetailsPage(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Change the color to your preferred background color
          image: DecorationImage(
            image: AssetImage('assets/images/bb.png'), // Add your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 8), // Space between app bar and image cards
            Container(
              height: 250,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: imageList.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            imageList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 100,
                    left: 8,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _currentPage =
                              (_currentPage - 1) % imageList.length;
                          if (_currentPage < 0) {
                            _currentPage = imageList.length - 1;
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: 8,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _currentPage =
                              (_currentPage + 1) % imageList.length;
                        });
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to Career Compass",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 233, 202, 161),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "We will help you find your best career path.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoachesPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0f4f6c),
                        foregroundColor: Colors.white,
                      ),
                      child: Text("Show Available Coaches"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff0f4f6c),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
