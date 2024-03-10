import 'package:flutter/material.dart';
import 'package:nawabganj_roktoseba/Home.dart';
import 'package:nawabganj_roktoseba/sing_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isPressed = false;

  Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> qn =
    await firestore.collection("Users").get();
    return qn;
  }

  TextEditingController mobileNumberController = TextEditingController();

  handleLogin() {
    // print(mobileNumberController.text);
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: isPressed ? Colors.black : Colors.red[800],
        fixedSize: Size(200, 50),
        foregroundColor: Colors.white);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "lib/assets/photos/rokotoseba_cover.png",
                // height: 100,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          padding:
                          const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                          child: const Text(
                            "রক্তসেবা লগইন",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(
                                  "মোবাইল নাম্বর ",
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red, // Set the color of the star to red
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: TextField(
                            controller: mobileNumberController,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'মোবাইল নাম্বর ',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              SpinKitRotatingCircle(
                                color: Colors.white,
                                size: 50.0,
                              );
                              handleLogin();
                              setState(() {
                                isPressed = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeActivity(phoneNumber: mobileNumberController.text)),
                              );
                            },
                            onLongPress: () {
                              setState(() {
                                isPressed = false; // Reset the state when the button is released
                              });
                            },
                            child: Text("লগ ইন"),
                            style: buttonStyle,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "আপনার একাঊন্ট নেই?",
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                        //   child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        //     future: getData(),
                        //     builder: (_, snapshot) {
                        //       if (snapshot.connectionState == ConnectionState.waiting) {
                        //         return Center(
                        //           child: CircularProgressIndicator(),
                        //         );
                        //       } else if (snapshot.hasError) {
                        //         return Center(
                        //           child: Text("Error: ${snapshot.error}"),
                        //         );
                        //       } else {
                        //         if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                        //           return Center(
                        //             child: Text("No data available"),
                        //           );
                        //         } else {
                        //           return ListView.builder(
                        //             shrinkWrap: true,
                        //             itemCount: snapshot.data!.docs.length,
                        //             itemBuilder: (_, index) {
                        //               return ListTile(
                        //                 title: Text(snapshot.data!.docs[index].get("name")),
                        //               );
                        //             },
                        //           );
                        //         }
                        //       }
                        //     },
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUp()),
                              );
                            },
                            child: Text("নতুন একাউন্ট তৈরি করুন"),
                            style: buttonStyle,
                          ),
                        ),
                      ],
                    ),
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
