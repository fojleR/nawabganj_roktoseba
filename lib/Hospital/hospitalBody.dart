import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import statement
import 'hospitalCard.dart';

class HospitalBody extends StatelessWidget {
  final String? phoneNumber;
  final String? name;
  final String? blood;

  const HospitalBody({
    Key? key,
    this.phoneNumber,
    this.name,
    this.blood,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('lib/assets/hospital.json'), // Assuming hospital.json is in the assets folder
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // Check if data is successfully loaded
          if (snapshot.hasData) {
            // Parse JSON data
            List<dynamic> data = json.decode(snapshot.data.toString());

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                // Access data for each hospital
                var hospital = data[index];
                return HospitalCard(
                  hospitalName: hospital['name'],
                  address: hospital['address'],
                  phoneNumber: hospital['mobile'],
                );
              },
            );
          } else {
            // If data is not yet loaded, show a loading indicator
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
