
/////////////////////////////// create new Activity /////////////////////////////////////////////////////

import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/Entity/calendar.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/activity_page/contact.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/Entity/inputfeild.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/activity_page/select_members.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);
  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
////////////////////////////////////start and end time variables///////////////////////////////
  TimeOfDay _starttime = TimeOfDay.now().replacing(hour: 11, minute: 30);
  TimeOfDay _endtime = TimeOfDay.now().replacing(hour: 11, minute: 30);

  ///////////////////controllers///////////////////////////////////////
  TextEditingController _titleController = TextEditingController();

/////////////////////////intialisation//////////////////////////////
  List<int> remindList = [5, 10, 15, 20];
  List<String> progressList = [
    "To Do (25%)",
    "In Progress (50%)",
    "Done (100%)",
    "Blocked (10%)",
    "Test Stage (12%)"
  ];
  List<String> memberList = [];
  List<Color> progressColors = [
    Colors.green,
    Colors.pink,
    const Color.fromARGB(255, 11, 137, 240),
    Colors.yellow,
    Colors.red
  ];
  List<String> ownerList = ["option1", "option2", "option3"];
  int _remindBefore = 10;
  String _progress = "To Do (25%)";
  List<String> repeatList = ["None", "Everyday", "Weekdays", "Weekend"];
  String _repeat = "None";
  int _number = 0;
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  String? selecteddepartment;
  String? _selectedOwnerName;
  ImageProvider? _selectedOwnerImage;

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  void _selectOwner() async {
    final Contact? selectedOwner = await Navigator.push<Contact?>(
      context,
      MaterialPageRoute(builder: (context) => const SelectContact()),
    );
    if (selectedOwner != null) {
      setState(() {
        _selectedOwnerName = selectedOwner.name;
        _selectedOwnerImage = NetworkImage(selectedOwner.image);
      });
    }
  }

  //////////////////////////////////list of corresponding Types//////////////////////////////////
  final List<Map<String, dynamic>> options = [
    {"text": "Meeting", "icon": Icons.calendar_month_rounded},
    {"text": "Visio ", "icon": Icons.camera_alt},
    {"text": "Call ", "icon": Icons.call},
    {"text": "SMS", "icon": Icons.sms},
    {"text": "Email", "icon": Icons.email},
    {"text": "Dossier", "icon": Icons.miscellaneous_services},
  ];
  String? _selectedActivity;
  IconData? _selectedIcon;
  bool _showActivityTypeOptions = false;
  //////////////////////////////////////////////////////////////////////////////////////////////////////
  void toggleActivityTypeOptions() {
    setState(() {
      _showActivityTypeOptions = !_showActivityTypeOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    String selectedItem = options[0]["text"].toString();

    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//////////////////////////calendar///////////////////////////////////////////////////////
              calendar(),
///////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),
//////////////////////////////////Activity Type/////////////////////////////////////
              const Text(
                "Activity Type",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              _buildActivityTypeOptions(),
////////////////////////////////////////////////////////////////////////////////
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
                hintText: "Enter Your Task Title",
                controller: _titleController,
                readOnly: false,
                onTap: toggleActivityTypeOptions,
                suffixIcon: _selectedIcon != null
                    ? Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(_selectedIcon),
                          const SizedBox(width: 10),
                          Text(
                            _selectedActivity ?? '',
                            style: const TextStyle(
                              fontSize:
                                  18, 
                            ),
                          ),
                        ],
                      )
                    : null,
              ),
              SizedBox(
                height: 10,
              ),
///////////////////////////////////select Owner/////////////////////////////////////////////////////////////
              const Text(
                "Owner",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: "Select Owner",
                onTap:
                    _selectOwner, 
                controller: TextEditingController()
                  ..text = _selectedOwnerName ??
                      "", 
                readOnly: true, 
                suffixIcon: _selectedOwnerImage != null
                    ? Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CircleAvatar(
                            backgroundImage: _selectedOwnerImage,
                            radius: 20, 
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _selectedOwnerName ?? '',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      )
                    : null,
              ),
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 22,
              ),
/////////////////////////////////////////////start and end time/////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, 
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
/////////////////////////////////////////Add members////////////////////////////////////////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Members $_number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.start,
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
/////////////////////////////////////////Add followers////////////////////////////////////////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Followers $_number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.start,
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
///////////////////////////////////Corresponding Stage////////////////////////////////////////
              const Text(
                "Corresponding Stage",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 15,
              ),
              DropdownButtonFormField<String>(
                value: _progress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors
                          .purple, 
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors
                          .purple, 
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.purple, 
                    ),
                  ),
                ),
                items: progressList
                    .map<DropdownMenuItem<String>>(
                        (String depar) => DropdownMenuItem<String>(
                              value: depar,
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: progressColors[
                                          progressList.indexOf(depar)],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(depar),
                                ],
                              ),
                            ))
                    .toList(),
                style: const TextStyle(
                    color: Color.fromARGB(255, 111, 111, 111), fontSize: 14),
                onChanged: (String? newValue) {
                  setState(() {
                    _progress = newValue!;
                  });
                },
              ),
//////////////////////////////////////////////////////////////////////////
              SizedBox(height: 20),
//////////////////remind me and repeat ///////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remind",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        DropdownButtonFormField<int>(
                          value: _remindBefore,
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              'assets/rappel.png',
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          items: remindList
                              .map<DropdownMenuItem<int>>(
                                  (int depar) => DropdownMenuItem<int>(
                                        value: depar,
                                        child: Text("$depar"),
                                      ))
                              .toList(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 111, 111, 111),
                              fontSize: 14),
                          onChanged: (int? newValue) {
                            setState(() {
                              _remindBefore = newValue!;
                            });
                          },
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
                          "Repeat",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        DropdownButtonFormField<String>(
                          value: _repeat, 
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              'assets/repeat.png',
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          items: repeatList
                              .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      ))
                              .toList(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 111, 111, 111),
                              fontSize: 14),
                          onChanged: (String? newValue) {
                            setState(() {
                              _repeat = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

/////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 15,
              ),
////////////////check boxes/////////////////////////////
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked1,
                        activeColor: Colors.purple,
                        onChanged: (newBool) =>
                            setState(() => isChecked1 = newBool),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Reminder before start date',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked2,
                        activeColor: Colors.purple,
                        onChanged: (newBool) =>
                            setState(() => isChecked2 = newBool),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Reminder before due date',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
/////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 25,
              ),
/////////////////////////////////save Button///////////////////////////////////////////
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


//////////////////////////////////////build activity type widget////////////////////////////////
  Widget _buildActivityTypeOptions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          {
            "text": "Meeting",
            "icon": Icons.calendar_month_rounded,
          },
          {
            "text": "Visio",
            "icon": Icons.camera_alt,
          },
          {
            "text": "Call",
            "icon": Icons.call,
          },
          {
            "text": "SMS",
            "icon": Icons.sms,
          },
          {
            "text": "Email",
            "icon": Icons.email,
          },
          {
            "text": "Dossier",
            "icon": Icons.miscellaneous_services,
          },
        ].map<Widget>((option) {
          final String text = option["text"] as String;
          final IconData icon = option["icon"] as IconData;
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 4.0), 
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedActivity = text;
                  _selectedIcon = icon;
                  _titleController.text =
                      text; 
                  _showActivityTypeOptions = false;
                });
              },
              child: Chip(
                label: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white, 
                  ),
                ),
                backgroundColor: Colors.purple,
                avatar: Icon(
                  icon,
                  color: Colors.white, 
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}
