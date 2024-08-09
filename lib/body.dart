import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/screen/home_screen.dart';
import 'package:flutter_instagram_clone/screen/seach_screen.dart';

class InstaBody extends StatelessWidget {
  final int index;
  const InstaBody({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
     if(index == 0) {
       return HomeScreen();
     } else if(index == 1) {
       return SearchScreen();
     } else {
       return Center(child: Icon(Icons.account_circle, size: 64,));
     }
  }
}
