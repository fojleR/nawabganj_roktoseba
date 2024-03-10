import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String bloodGroup;
  final String village;
  final String union;
  final String upazilla;
  final String phoneNumber;
  final String lastDonationDate;

  const CustomCard({
    Key? key,
    required this.name,
    required this.bloodGroup,
    required this.village,
    required this.union,
    required this.upazilla,
    required this.phoneNumber,
    required this.lastDonationDate,
  }) : super(key: key);

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        elevation: 10,
        shadowColor: Colors.red,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.red[800],
                width: double.infinity,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "রক্তদানের সময় হয়েছে",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: 123,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white70,
                        ),
                        child: Center(
                          child: Text(
                            bloodGroup,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[800],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white70,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("গ্রামঃ $village"),
                            Text("ইউনিয়নঃ $union"),
                            Text("থানাঃ $upazilla"),
                            Text("মোবাইল নাম্বরঃ $phoneNumber"),
                            Text("শেষ রক্তদানের তারিখঃ $lastDonationDate"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () async {
                    final Uri url = Uri(
                      scheme: 'tel',
                      path: 'tel:$phoneNumber', // Include the tel: prefix for phone numbers
                    );
                    if (await canLaunch(url.toString())) {
                      await launch(url.toString());
                    } else {
                      MySnackBar("কল করা যাচ্ছে না", context);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call),
                      SizedBox(width: 10),
                      Text("কল দিন"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
