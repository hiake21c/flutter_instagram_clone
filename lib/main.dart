import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'body.dart';

void main() {
  runApp(const InstaCloneApp());
}

class InstaCloneApp extends StatelessWidget {
  const InstaCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.black,
        useMaterial3: true,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
        )
      ),
      home: const InstaCloneHome(),
    );
  }
}

class InstaCloneHome extends StatefulWidget {
  const InstaCloneHome({super.key});

  @override
  State<InstaCloneHome> createState() => _InstaCloneHomeState();
}

class _InstaCloneHomeState extends State<InstaCloneHome> {
  late int index;


  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index == 0 ? AppBar(
          title: Text('Instagram', style: GoogleFonts.lobsterTwo(color: Colors.black, fontSize: 28),),
          centerTitle: false,
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_outline, size: 32,),
              onPressed: () {
                print('Favorite button pressed');
              },
            ),
            IconButton(
              icon: Icon(CupertinoIcons.paperplane, size: 32,),
              onPressed: () {
                print('Direct Message button pressed');
              },
            ),
          ]
      ) : null,
      body: InstaBody(index: index),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() => this.index = index);
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 28,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search , size: 28), label: 'Search'),
        ],
      ),
    );
  }
}



