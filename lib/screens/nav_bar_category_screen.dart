import 'package:SmartPrep/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NavBarCategoryScreen extends StatefulWidget {
  const NavBarCategoryScreen({Key? key}) : super(key: key);

  @override
  _NavBarCategoryScreenState createState() => _NavBarCategoryScreenState();
}

class _NavBarCategoryScreenState extends State<NavBarCategoryScreen> {
  int _selectedIndex = 0;

  List<Widget> _buildCategoryWidgets(BuildContext context) {
    return <Widget>[
      Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(category: 'WEB DEVELOPMENT'),
              ),
            );
          },
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 250,
              height: 120,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.web, size: 40, color: Colors.white),
                  SizedBox(height: 10),
                  Text('WEB DEVELOPMENT',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text('HTML, CSS, JS, etc.',
                      style: TextStyle(fontSize: 8, color: Colors.white70)),
                ],
              ),
            ),
          ),
        ),
      ),
      Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(category: 'PROGRAMMING'),
              ),
            );
          },
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 250,
              height: 120,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.code, size: 40, color: Colors.white),
                  SizedBox(height: 10),
                  Text('PROGRAMMING',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text('Python, Java, C++, etc.',
                      style: TextStyle(fontSize: 8, color: Colors.white70)),
                ],
              ),
            ),
          ),
        ),
      ),
      Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(category: 'GK'),
              ),
            );
          },
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 250,
              height: 120,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(228, 255, 136, 0), Color.fromARGB(255, 255, 195, 64)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.public, size: 40, color: Colors.white),
                  SizedBox(height: 10),
                  Text('GK',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text('General Knowledge',
                      style: TextStyle(fontSize: 8, color: Colors.white70)),
                ],
              ),
            ),
          ),
        ),
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.blueAccent,
      ),
      body:SingleChildScrollView(
        child: Container(
        width: double.infinity,
         height: MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top -
        kBottomNavigationBarHeight,
    
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _buildCategoryWidgets(context)[_selectedIndex],
      ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'WEB DEV',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'PROGRAMMING',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'GK',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
