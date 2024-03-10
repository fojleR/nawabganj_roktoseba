import 'package:flutter/material.dart';
import '../DropdownAndLeble.dart';
import '../dropdwon_button.dart';
import '../customCard.dart';
import '../update.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../log_in.dart';

class ProfileBody extends StatelessWidget {
  final String? phoneNumber;
  final String? name;
  final String? blood;
  const ProfileBody({Key? key,
    this.phoneNumber,
    this.name,
    this.blood,
  }) : super(key: key);

  Future<void> updateDonationDate(BuildContext context, String date, String month, String year) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(phoneNumber) // Assuming the document ID is the phone number
          .update({
        'donationDate': date,
        'donationMonth': month,
        'donationYear': year,
      });

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Donation date updated successfully')),
      );

      // Reload the page
      Navigator.pop(context); // Pop the current page
      Navigator.pushReplacement( // Push the page again
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ProfileBody(
            phoneNumber: phoneNumber,
          ),
        ),
      );
    } catch (error) {
      print('Error updating donation date: $error');
      // Show an error message if needed
    }
  }


  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.red[800],
      foregroundColor: Colors.white,
      fixedSize: Size(200, 50),
    );
    final List<String> days = List.generate(31, (index) => (index + 1).toString());
    final List<String> years = List.generate(50, (index) => (index + 2024).toString());
    var DonateDate = "";
    var DonateMonth = "";
    var DonateYear = "";
    var DonateOffPeriod = "";
    final List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
    ];
    final List<String> offmonths = [
      '১ মাস', '২ মাস','৩ মাস','৪ মাস','৫ মাস','৬ মাস','৭ মাস','৮ মাস','৯ মাস','১০ মাস','১১ মাস','১২ মাস','২ বছর', 'সারাজীবন'
    ];

    void updateDonateDate(String value){
      DonateDate = value;
    }
    void updateDonateMonth(String value){
      DonateMonth = value;
    }
    void updateDonateYear(String value){
      DonateYear = value;
    }

    void updateDonateOffPeriod(String value){
      DonateOffPeriod = value;
    }

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
                          color: Colors.red[100],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                              ),
                              child: Text(
                                "আপনার তথ্যসমূহ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text('fojle rabbi'),
                            SizedBox(height: 8.0),
                            Text("মোবাইলঃ " + (phoneNumber ?? '')),
                            SizedBox(height: 8.0),
                            Text("ইমেইলঃ ------------------"),
                            SizedBox(height: 8.0),
                            Text("রক্তের গ্রুপঃ ----------------"),
                            SizedBox(height: 8.0),
                            Text("সর্বশেষ রক্তদানঃ -------------"),
                            SizedBox(height: 8.0),
                            Text("জেন্ডারঃ ----------"),
                            SizedBox(height: 8.0),
                            Text("জন্ম তারিখঃ --------------"),
                            SizedBox(height: 8.0),
                            Text("বর্তমান ঠিকানাঃ --------------"),
                            SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateProfile(phoneNumber: phoneNumber),
                                  ),
                                );
                              },
                              child: Text("আপডেট করুন"),
                              style: buttonStyle,
                            ),
                            SizedBox(height: 10.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LogIn(),
                                  ),
                                );
                              },
                              child: Text("লগ আউট করুন করুন"),
                              style: buttonStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
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
                          color: Colors.red[100],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                              ),
                              child: Text(
                                "রক্তদানের তারিখ আপডেট করুন",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "শেষ রক্তদানের তারিখ ",  // Title Name
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          DropdownAndLabel(
                                              label: "তারিখ",
                                              isRequired: true,
                                              items: days,
                                              placeholder: "তারিখ সিলেক্ট করুন",
                                              onChanged: updateDonateDate
                                          ),
                                          DropdownAndLabel(label: "মাস", isRequired: true, items: months, placeholder: "মাস সিলেক্ট করুন", onChanged: updateDonateMonth),
                                          DropdownAndLabel(label: "সাল", isRequired: true, items: years, placeholder: "সাল সিলেক্ট করুন", onChanged: updateDonateYear),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                updateDonationDate(context, DonateDate, DonateMonth, DonateYear);
                              },
                              child: Text("আপডেট করুন"),
                              style: buttonStyle,
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
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
                          color: Colors.red[100],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                              ),
                              child: Text(
                                "রক্তদান বন্ধ করুন ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text("কেন বন্ধ করতে চাচ্ছেন?"),
                            Container(
                              width: 200,
                              child: TextFormField(
                                minLines: 5, // Set minLines to the desired number of lines
                                maxLines: null, // Set maxLines to null for a dynamic number of lines
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  labelText: 'Enter your paragraph',
                                  hintText: 'Type your text here...',
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white, // Set background color
                                  filled: true, // Enable filling the background color
                                ),
                              ),
                            ),
                            Text("কতো দিনের জন্য বন্ধ করতে চান?"),
                            Container(
                              width: 100,
                              child: DropDownButton(items: offmonths, onChanged: updateDonateOffPeriod),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("বন্ধ করুন"),
                              style: buttonStyle,
                            ),
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
}
