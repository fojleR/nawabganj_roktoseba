import 'package:flutter/material.dart';
import '../../Home.dart';
import '../../Hospital/hospital.dart';


class ImportantBody extends StatelessWidget {
  final String? phoneNumber;
  final String? name;
  final String? blood;

  const ImportantBody({
    Key? key,
    this.phoneNumber,
    this.name,
    this.blood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Image.asset(
                        "lib/assets/photos/rokotoseba_cover.png",
                        // height: 100,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 0.0,
                          bottom: 16.0,
                          left: 0.0,
                          right: 0.0,
                        ),
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                buildCard(context,Icons.local_hospital, 'Hospital', 'Software Engineer'),
                                buildCard(context,Icons.fire_extinguisher, 'ডাক্তার', 'Software Engineer'),
                                buildCard(context,Icons.local_hospital, 'এম্বুলেন্স', 'Software Engineer'),
                                buildCard(context,Icons.local_hospital, 'ফায়ার সার্ভিস', 'Software Engineer'),
                                buildCard(context,Icons.local_hospital, 'পল্লী বিদ্যুৎ সার্ভিস', 'Software Engineer'),
                                buildCard(context,Icons.local_hospital, 'সাংবাদিক', 'Software Engineer'),
                                buildCard(context,Icons.local_hospital, 'পুলিশ স্টেশন', 'Software Engineer'),
                                buildCard(context,Icons.local_hospital, 'জরুরী সেবাসমূহ', 'Software Engineer'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context, IconData icon, String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        // Navigate to the respective page based on the card tapped
        if (title == 'Hospital') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Hospital(phoneNumber: phoneNumber)),
          );
        } else {
          // Handle other card taps
        }
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: Colors.blue,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
