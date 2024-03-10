import 'package:flutter/material.dart';
import 'CustomBottomNav.dart';
import 'CustormDrawer.dart';
import 'Home.dart';
import 'Body.dart';

class BottomNav extends StatefulWidget {
  final String? phoneNumber;
  const BottomNav({Key? key, this.phoneNumber}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _currentIndex = 1;

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Body(),
      drawer: CustomDrawer(phoneNumber: widget.phoneNumber),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTabTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            _scaffoldKey.currentState!.openDrawer();
          } else if (index == 1) {
            MySnackBar('Home', context);
          } else if (index == 2) {
            MySnackBar('About', context);
          } else if (index == 3) {
            MySnackBar('Blog', context);
          }
        },
      ),
    );
  }
}
