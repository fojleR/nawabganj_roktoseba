import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DropdownAndLeble.dart';
import 'bottomNav.dart';

class HomeActivity extends StatelessWidget{
  final String? phoneNumber;

  const HomeActivity({Key? key, this.phoneNumber}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.red[800],
      foregroundColor: Colors.white,
      fixedSize: Size(200, 50),
    );
    // TODO: implement build
    return BottomNav(phoneNumber: phoneNumber,);
      // bottomNavigationBar: BottomNav(),
      // Set the background color here

  }

}