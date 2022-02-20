
import 'package:flutter/material.dart';
import 'package:inter_native/core/token_helper.dart';
import 'package:inter_native/views/favorite_page.dart';
import 'package:inter_native/views/home_page.dart';
import 'package:inter_native/views/login_page.dart';
import 'package:inter_native/views/profile_page.dart';

class PageState extends StatefulWidget {
  const PageState({Key? key}) : super(key: key);

  @override
  _PageStateState createState() => _PageStateState();
}

class _PageStateState extends State<PageState> {
  late List<Widget> pages;
  int curentIndex = 1;

  @override
  void initState() {
    super.initState();
   
    pages = const [FavoritePage(),HomePage(),ProfilePage()];
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curentIndex,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: ""),

          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),


        ],
        onTap: (newIndex) {

          curentIndex = newIndex;
          setState(() {
            
          });
        },
      ),
      body: pages[curentIndex],
    );}
  }

