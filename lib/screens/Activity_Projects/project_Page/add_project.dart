///////////////////////////// Create new project /////////////////////////////////////

import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/Entity/calendar.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/Entity/colorPalette.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/Entity/inputfeild.dart';

class AddProjectPage extends StatefulWidget {
  AddProjectPage({Key? key}) : super(key: key);

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
////////////////////////////////////start and end time variables///////////////////////////////
  TimeOfDay _starttime = TimeOfDay.now().replacing(hour: 11, minute: 30);
  TimeOfDay _endtime = TimeOfDay.now().replacing(hour: 11, minute: 30);

  TextEditingController _titleController = TextEditingController();

/////////////////////////intialisation//////////////////////////////
  List<String> shareList = [
    "Direction Générale",
    "Administration",
    "Développement",
    "Direction commerciale",
    "Marketing",
    "BUCC",
    "BU Comunik VOIP",
    "Infrastructure"
  ];
  List<String> accountsList = [
    "SWISH",
    "test",
    "GoDiez",
    "support ipbx",
    "entreprises Zouari",
    "IIBRACALL",
    "Experty Team Tunisie",
  ];
  String _share = "Administration";
  String _account = "test";
  List<String> memberList = [];
  int _number = 0;
  //////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ////////////////////////////////////////Calendar////////////////////////////////////////////
              calendar(),
              ////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),

              ///////////////////////////////Task title///////////////////////////////
              const Text(
                "Title",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: "Enter Your Project Title",
                controller: _titleController,
                readOnly: false,
              ),

              /////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),
              /////////////////////////////////////////////start and end time/////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start time",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.all(8),
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple.withOpacity(0.6),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  cursorColor: Colors.grey,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: _starttime.format(context),
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(showPicker(
                                    value: Time(
                                        hour: _starttime.hour,
                                        minute: _starttime.minute),
                                    onChange: (TimeOfDay time) {
                                      setState(() {
                                        _starttime = time;
                                      });
                                      print(_starttime);
                                    },
                                    onChangeDateTime: (DateTime DateTime) {},
                                    is24HrFormat: false,
                                    iosStylePicker: false,
                                    disableHour: false,
                                    displayHeader: true,
                                  ));
                                },
                                icon: Icon(
                                  Icons.access_time,
                                  color: Colors.purple.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "End time",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.all(8),
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple.withOpacity(0.6),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  cursorColor: Colors.grey,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: _endtime.format(context),
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(showPicker(
                                    value: Time(
                                        hour: _endtime.hour,
                                        minute: _endtime.minute),
                                    onChange: (TimeOfDay time) {
                                      setState(() {
                                        _endtime = time;
                                      });
                                      print(_endtime);
                                    },
                                    onChangeDateTime: (DateTime DateTime) {},
                                    is24HrFormat: false,
                                    iosStylePicker: false,
                                    disableHour: false,
                                    displayHeader: true,
                                  ));
                                },
                                icon: Icon(
                                  Icons.access_time,
                                  color: Colors.purple.withOpacity(0.9),
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
              //////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),
              ///////////////////////////Colors///////////////////////////////////////////////////////
              Center(child: colorPalette()),
              ///////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),
              /////////////////////////////////////////Followers////////////////////////////////////////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Followers $_number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.all(8),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple.withOpacity(0.6),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.grey,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "",
                              suffixIcon: DropdownButton<String>(
                                underline: Container(),
                                icon: Icon(
                                  Icons.add,
                                  size: 35,
                                  color: Colors.purple,
                                ),
                                elevation: 4,
                                onChanged: (String? newValue) {
                                  setState(() {});
                                },
                                items: memberList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  },
                                ).toList(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 111, 111, 111),
                                  fontSize: 13,
                                ),
                              ),
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),
              /////////////////////////////////////////Accounts////////////////////////////////////////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Accounts",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField<String>(
                    value: _account,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.purple.withOpacity(0.6),
                        ),
                      ),
                    ),
                    items: accountsList
                        .map<DropdownMenuItem<String>>(
                            (String depar) => DropdownMenuItem<String>(
                                  value: depar,
                                  child: Text(depar),
                                ))
                        .toList(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 111, 111, 111),
                        fontSize: 14),
                    onChanged: (String? newValue) {
                      setState(() {
                        _account = newValue!;
                      });
                    },
                  ),
                ],
              ),

              ////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),

              ///////////////////////////////////Share with////////////////////////////////////////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Share with",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField<String>(
                    value: _share,
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        'assets/share.png',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.purple.withOpacity(0.6),
                        ),
                      ),
                    ),
                    items: shareList
                        .map<DropdownMenuItem<String>>(
                            (String depar) => DropdownMenuItem<String>(
                                  value: depar,
                                  child: Text(depar),
                                ))
                        .toList(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 111, 111, 111),
                        fontSize: 14),
                    onChanged: (String? newValue) {
                      setState(() {
                        _share = newValue!;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(
                height: 25,
              ),

              ////////////////////////////////Buttons///////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                  ),
                ],
              ),
            ]),
          ))),
////////////////////////////////////////////////////////////////////////////////////
    );
  }

////////////////////////app bar//////////////////////////////////////////
  _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(
        "Create New Project",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
