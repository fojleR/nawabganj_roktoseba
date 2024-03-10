import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalCard extends StatelessWidget {
  final String hospitalName;
  final String address;
  final String phoneNumber;

  const HospitalCard({
    Key? key,
    required this.hospitalName,
    required this.address,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_hospital, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    hospitalName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.grey[700]),
                  SizedBox(width: 8),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    phoneNumber,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: IconButton(
                  icon: Icon(Icons.phone),
                  color: Colors.white,
                  onPressed: () async {
                    final Uri url = Uri(
                      scheme: 'tel',
                      path: 'tel:$phoneNumber', // Include the tel: prefix for phone numbers
                    );
                    if (await canLaunch(url.toString())) {
                      await launch(url.toString());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("কল করা যাচ্ছে না")),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
