import 'package:flutter/material.dart';
import 'package:nawabganj_roktoseba/DropdownAndLeble.dart';
import 'package:nawabganj_roktoseba/Home.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateProfile extends StatefulWidget {
  final String? phoneNumber;
  const UpdateProfile({Key? key, this.phoneNumber}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black, backgroundColor: Colors.red[800], // Change this color for the pressed state
    // foregroundColor: Colors.white,
    fixedSize: Size(200, 50),
  );

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Map<String, dynamic>> loadUpazillaData() async {
    String jsonString = await rootBundle.loadString('lib/assets/roktosebaData.json');
    return json.decode(jsonString);
  }

  late List<String> allUnion;
  late List<String> allGram;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController birthMonthController = TextEditingController();
  final TextEditingController birthYearController = TextEditingController();
  final TextEditingController presentUpazillaController = TextEditingController();
  final TextEditingController presentUnionController = TextEditingController();
  final TextEditingController presentVillageController = TextEditingController();
  final TextEditingController permanentUpazillaController = TextEditingController();
  final TextEditingController permanentUnionController = TextEditingController();
  final TextEditingController permanentVillageController = TextEditingController();

  late String name;
  late String mobile;
  late String email;
  late String blood;
  late String gender;
  late String birthDate;
  late String birthMonth;
  late String birthYear;
  late String presentUpazilla;
  late String presentUnion;
  late String presentVillage;
  late String permanentUpazilla;
  late String permanentUnion;
  late String permanentVillage;

  void loadData() async {
    try {
      String jsonString = await rootBundle.loadString('lib/assets/roktosebaData.json');
      Map<String, dynamic> data = json.decode(jsonString);
      // Handle data loading
    } catch (e) {
      print('Error loading JSON data: $e');
    }
  }

  void loadCurrentUnionData(String upazilla) async {
    Map<String, dynamic> data = await loadUpazillaData();
    // print('Upazilla Data: $data');

    if (data.containsKey('roktosebaData') && data['roktosebaData'].containsKey(upazilla)) {
      List<dynamic> unionsData = data['roktosebaData'][upazilla]['unions'];
      List<String> unionsList = unionsData.map((union) => union['name'].toString()).toList();

      setState(() {
        currentAllUnion = unionsList;
      });

      // print('Union List: $unionsList');
    } else {
      print('Upazilla $upazilla not found in data.');
    }
  }
  void loadPermanentUnionData(String upazilla) async {
    Map<String, dynamic> data = await loadUpazillaData();
    // print('Upazilla Data: $data');

    if (data.containsKey('roktosebaData') && data['roktosebaData'].containsKey(upazilla)) {
      List<dynamic> unionsData = data['roktosebaData'][upazilla]['unions'];
      List<String> unionsList = unionsData.map((union) => union['name'].toString()).toList();

      setState(() {
        permanentAllUnion= unionsList;
      });

      // print('Union List: $unionsList');
    } else {
      print('Upazilla $upazilla not found in data.');
    }
  }

  void loadCurrentGramData(String union, String upazilla) async {
    Map<String, dynamic> data = await loadUpazillaData();
    // print('Union Data: $data');

    if (data.containsKey('roktosebaData')) {
      Map<String, dynamic> upazillaData = data['roktosebaData'][upazilla];

      if (upazillaData != null) {
        List<dynamic> unions = upazillaData['unions'];

        // Find the specified union
        var specifiedUnion = unions.firstWhere((u) => u['name'] == union, orElse: () => null);

        if (specifiedUnion != null) {
          List<dynamic> villages = specifiedUnion['villages'];

          List<String> gramsList = villages.map((village) => village.toString()).toList();

          setState(() {
            currentAllGram = gramsList;
          });

          // print('Gram List: $gramsList');
        } else {
          print('Union $union not found in data.');
        }
      } else {
        print('Upazilla $upazilla not found in data.');
      }
    } else {
      print('roktosebaData key not found in data.');
    }
  }
  void loadPermanentGramData(String union, String upazilla) async {
    Map<String, dynamic> data = await loadUpazillaData();
    // print('Union Data: $data');

    if (data.containsKey('roktosebaData')) {
      Map<String, dynamic> upazillaData = data['roktosebaData'][upazilla];

      if (upazillaData != null) {
        List<dynamic> unions = upazillaData['unions'];

        // Find the specified union
        var specifiedUnion = unions.firstWhere((u) => u['name'] == union, orElse: () => null);

        if (specifiedUnion != null) {
          List<dynamic> villages = specifiedUnion['villages'];

          List<String> gramsList = villages.map((village) => village.toString()).toList();

          setState(() {
            currentAllGram = gramsList;
          });

          // print('Gram List: $gramsList');
        } else {
          print('Union $union not found in data.');
        }
      } else {
        print('Upazilla $upazilla not found in data.');
      }
    } else {
      print('roktosebaData key not found in data.');
    }
  }

  final List<String> currentAllUpazilas = [
    'নবাবগঞ্জ',
    'বিরামপুর',
    'ফুলবাড়ী',
    'হাকিমপুর',
    'ঘোড়াঘাট'
  ];
  List<String> currentAllUnion = [
    'বড়গাছি',
    'বড়পুর',
  ];

  List <String> currentAllGram = [
    'বড়গাছি',
    'বড়পুর',
  ];
  final List<String> permanentAllUpazilas = [
    'নবাবগঞ্জ',
    'বিরামপুর',
    'ফুলবাড়ী',
    'হাকিমপুর',
    'ঘোড়াঘাট'
  ];
  List<String> permanentAllUnion = [
    'বড়গাছি',
    'বড়পুর',
  ];

  List <String>permanentAllGram = [
    'বড়গাছি',
    'বড়পুর',
  ];


  final List<String> items = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'AB+',
    'AB-',
    'B+',
    'B-',
    'O+',
    'O-',
    'Bombay Blood Group',
    'Unknown'
  ];
  final List<String> Upazilla = [
    'A+',
    'A-',
    'AB+',
    'AB-',
    'B+',
    'B-',
    'O+',
    'O-',
    'Bombay Blood Group',
    'Unknown'
  ];

  final List<String> days = List.generate(31, (index) => (index + 1).toString());
  final List<String> years = List.generate(40, (index) => (index + 1980).toString());
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
  ];





  void updateBloodGroup(String value) {
    blood = value;
    print(blood);
  }
  void updatePresentUpazilla(String value){
    presentUpazilla = value;
    loadCurrentUnionData(presentUpazilla);
  }
  void updatePresentUnion(String value){
    presentUnion = value;
    loadCurrentGramData(presentUnion, presentUpazilla);
  }
  void updatePresentVillage(String value){
    presentVillage = value;
  }
  void updatePermanentUpazilla(String value){
    permanentUpazilla = value;
    loadPermanentUnionData(permanentUpazilla);
  }
  void updatePermanentUnion(String value){
    permanentUnion = value;
    loadPermanentGramData(permanentUnion, permanentUpazilla);
  }
  void updatePermanentVillage(String value){
    permanentVillage = value;
  }
  void updateBirthDate(String value){
    birthDate = value;
  }
  void updateBirthMonth(String value){
    birthMonth = value;
  }
  void updateBirthYear(String value){
    birthYear = value;
  }
  void updateGender(String value){
    gender = value;
  }

  void updatePresentAddress(List<String> address) {
    presentUpazilla = address[0];
    presentUnion = address[1];
    presentVillage = address[2];
  }

  void updatePermanentAddress(List<String> address) {
    permanentUpazilla = address[0];
    permanentUnion = address[1];
    permanentVillage = address[2];
  }

  void addData(BuildContext context) async {
    // Check if document with the phone number already exists
    bool phoneNumberExists = await FirebaseFirestore.instance.collection('Users').doc(mobile).get().then((doc) => doc.exists);

    if (phoneNumberExists) {
      // If document with the phone number exists, show an error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("User with this phone number already exists."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      // If document with the phone number doesn't exist, add the data
      FirebaseFirestore.instance.collection('Users').doc(mobile).set({
        'name': name,
        'mobile': mobile,
        'email': email,
        'blood': blood,
        'presentVillage': presentVillage,
        'presentUnion': presentUnion,
        'presentUpazilla': presentUpazilla,
        'permanentVillage': permanentVillage,
        'permanentUnion': permanentUnion,
        'permanentUpazilla': permanentUpazilla,
        'birthDate': birthDate,
        'birthMonth': birthMonth,
        'birthYear': birthYear,
        'gender': gender
      }).then((_) {
        // Navigate to the home screen after adding data
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeActivity()), // Replace HomeScreen with your actual home screen widget
        );
      }).catchError((error) {
        // Handle error if any
        print("Error adding document: $error");
      });
    }
  }





  void handleSubmit(BuildContext context){
    name = nameController.text;
    mobile = mobileController.text;
    email = emailController.text;

    // Add validation for required fields
    if (name.isEmpty || mobile.isEmpty || blood.isEmpty || birthDate.isEmpty || birthMonth.isEmpty || birthYear.isEmpty ||
        presentUpazilla.isEmpty || presentUnion.isEmpty || presentVillage.isEmpty || permanentUpazilla.isEmpty ||
        permanentUnion.isEmpty || permanentVillage.isEmpty || gender.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please fill in all required fields."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      // Call addData with the current context
      addData(context);
    }
  }


  // Other methods for loading union and gram data...

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
                          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                          child: const Text(
                            "রক্তসেবা আপডেট",
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
                                  "নাম ",
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
                          padding:  EdgeInsets.all(16.0),
                          child: TextField(
                            controller: nameController,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'নাম ',
                            ),

                          ),
                        ),const Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(
                                  "মোবাইল নাম্বর (ইংরেজী) ",
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
                          padding:  EdgeInsets.all(16.0),
                          child: TextField(
                            controller: mobileController,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'মোবাইল নাম্বর ',
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(
                                  "ইমেইল (যদি থাকে) ",
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(16.0),
                          child: TextField(
                            controller: emailController,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'ইমেইল ',
                            ),
                          ),
                        ),
                        DropdownAndLabel(
                          label: "রক্তের গ্রুপ ",
                          isRequired: true,
                          items: bloodGroups,
                          onChanged: updateBloodGroup, // Pass the callback function
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "জন্ম তারিখ (গোপন থাকবে)",  // Title Name
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
                                          onChanged: updateBirthDate
                                      ),
                                      DropdownAndLabel(label: "মাস", isRequired: true, items: months, placeholder: "মাস সিলেক্ট করুন", onChanged: updateBirthMonth),
                                      DropdownAndLabel(label: "সাল", isRequired: true, items: years, placeholder: "সাল সিলেক্ট করুন", onChanged: updateBirthYear),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "বর্তমান ঠিকানা",  // Title Name
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
                                      DropdownAndLabel(label: "উপজেলা", isRequired: true, items: currentAllUpazilas, onChanged: updatePresentUpazilla),
                                      DropdownAndLabel(label: "ইউনিয়ন", isRequired: true, items: currentAllUnion, onChanged: updatePresentUnion),
                                      DropdownAndLabel(label: "গ্রাম", isRequired: true, items: currentAllGram, onChanged: updatePresentVillage),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "স্থায়ী ঠিকানা",  // Title Name
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
                                      DropdownAndLabel(label: "উপজেলা", isRequired: true, items: permanentAllUpazilas, onChanged: updatePermanentUpazilla,),
                                      DropdownAndLabel(label: "ইউনিয়ন", isRequired: true, items: permanentAllUnion, onChanged: updatePermanentUnion),
                                      DropdownAndLabel(label: "গ্রাম", isRequired: true, items: permanentAllGram, onChanged: updatePermanentVillage),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DropdownAndLabel(label: "জেন্ডার ", isRequired: true, items: ["পুরুষ", "মহিলা"], onChanged: updateGender),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              handleSubmit(context);
                            },
                            child: Text("আপডেট করুন", style: TextStyle(color: Colors.white)),
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
