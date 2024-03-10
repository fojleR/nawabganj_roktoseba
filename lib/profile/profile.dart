import 'package:flutter/material.dart';
import 'package:nawabganj_roktoseba/profile/profileBody.dart';
import '../CardBody.dart';
import '../CustomBottomNav.dart';
import '../CustormDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../bottomNav.dart';
import 'profile.dart';

class Profile extends StatefulWidget {
  final String? phoneNumber;
  const Profile({Key? key, this.phoneNumber}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _currentIndex = 1;
  Map<String, String> userInfo = {}; // Initialize userInfo list

  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('mobile', isEqualTo: widget.phoneNumber)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final userData = snapshot.docs.first.data() as Map<String, dynamic>;
        print('User Data: $userData');
        // Store user data into userInfo list
        userInfo = {
          'name': userData['name'],
          'blood': userData['blood'],
          'phone': userData['mobile'],
          'address': userData['presentVillage'],
        };
        print(userInfo);
        setState(() {}); // Update the state to rebuild the UI with fetched data
      } else {
        print('User not found!');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
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
      body: ProfileBody(
          phoneNumber: widget.phoneNumber,
          name: userInfo['name'],
          blood: userInfo['name']
      ),
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
