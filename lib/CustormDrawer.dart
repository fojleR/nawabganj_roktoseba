import 'package:flutter/material.dart';
import 'bottomNav.dart';
import 'profile/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../important_numbers/important.dart';

class CustomDrawer extends StatefulWidget {
  final String? phoneNumber;
  const CustomDrawer({Key? key, this.phoneNumber}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int _selectedTileIndex = -1; // Initialize with an invalid index

  @override

  void handleTap() {
    print("tapped");
    print(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              accountName: Text("fojle rabbi", style: TextStyle(color: Colors.black)),
              accountEmail: Text("fojleRabbi@email.com"),
              currentAccountPicture: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV0ZHUU0AnQxojd1WRGfzt3rIOfMixEdvNtqkHR10YyA&s"),
            ),
          ),
          buildListTile("Home", Icons.home, 0, () {
            Navigator.of(context).pop(); // Close the drawer
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => BottomNav(),
            ));
          }),
          buildListTile("Contact", Icons.contact_emergency, 1, () {
            Navigator.of(context).pop(); // Close the drawer
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Important(phoneNumber: widget.phoneNumber,),
            ));
          }),
          buildListTile("জরুরী নাম্বরসময়হ", Icons.numbers , 2, () {
            Navigator.of(context).pop(); // Close the drawer
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Important(phoneNumber: widget.phoneNumber)
            ));
          }),
          buildListTile("Message", Icons.message, 3, () {
            // Navigate to MessagePage
          }),
          buildListTile("Profile", Icons.person, 4, () {
            Navigator.of(context).pop(); // Close the drawer
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Profile(phoneNumber: widget.phoneNumber),
            ));
            // Navigate to ProfilePage
          }),
          buildListTile("Phone", Icons.phone, 4, () {
            // Navigate to PhonePage
          }),
          // Other ListTiles...
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, int index, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      tileColor: _selectedTileIndex == index ? Colors.red : null,
      onTap: () {
        onTap();
        handleTap();
        // Set the selected state for the tapped tile and reset others
        setState(() {
          _selectedTileIndex = index;
        });
      },
    );
  }
}
