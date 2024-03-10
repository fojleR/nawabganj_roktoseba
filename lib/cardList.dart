import 'package:flutter/material.dart';
import 'CardBody.dart';
import 'CustomBottomNav.dart';
import 'CustormDrawer.dart';
import 'Home.dart';
import 'Body.dart';
import 'bottomNav.dart';

class CardList extends StatefulWidget {
  final List<Map<String, String>> donorInfo;

  const CardList({Key? key, required this.donorInfo}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
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
      body: CardBody(donorInfo: widget.donorInfo),
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
            // No need to navigate to BottomNav screen as we are already on it
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
