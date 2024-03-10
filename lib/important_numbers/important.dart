import 'package:flutter/material.dart';
import 'package:nawabganj_roktoseba/profile/profileBody.dart';
import '../CardBody.dart';
import '../CustomBottomNav.dart';
import '../CustormDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../bottomNav.dart';
import 'importantBody.dart';


class Important extends StatefulWidget {
  final String? phoneNumber;
  const Important({Key? key, this.phoneNumber}) : super(key: key);

  @override
  _ImportantState createState() => _ImportantState();
}

class _ImportantState extends State<Important> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _currentIndex = 1;
  Map<String, String> userInfo = {}; // Initialize userInfo list

  void initState() {
    super.initState();
  }



  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ImportantBody(phoneNumber: widget.phoneNumber),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTabTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            _scaffoldKey.currentState!.openDrawer();
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNav()),
            );
            MySnackBar('Home', context);
          } else if (index == 2) {
            // MySnackBar('About', context);
          } else if (index == 3) {
            // MySnackBar('Blog', context);
          }
        },
      ),
    );
  }
}
