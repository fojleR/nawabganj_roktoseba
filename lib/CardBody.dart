import 'package:flutter/material.dart';
import 'package:nawabganj_roktoseba/DropdownAndLeble.dart';
import 'package:nawabganj_roktoseba/cardList.dart';
import 'dropdwon_button.dart';
import 'package:nawabganj_roktoseba/calender.dart';
import 'package:nawabganj_roktoseba/customCard.dart';

class CardBody extends StatelessWidget {
  final List<Map<String, String>> donorInfo;

  const CardBody({Key? key, required this.donorInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.red[800],
      foregroundColor: Colors.white,
      fixedSize: Size(200, 50),
    );

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
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: donorInfo.map((info) {
                      print(info);
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomCard(
                          name: info['name']!,
                          bloodGroup: info['bloodGroup']!,
                          village: info['village']!,
                          union: info['union']!,
                          upazilla: info['upazilla']!,
                          phoneNumber: info['phone']!,
                          lastDonationDate: "10/12/2024",
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
