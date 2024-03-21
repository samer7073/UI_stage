// ignore_for_file: prefer_const_constructors

import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/bottomNavigationBar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import 'add_details.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
////////////////////////////////////start and end time variables///////////////////////////////
  TimeOfDay _starttime = TimeOfDay.now().replacing(hour: 11, minute: 30);
  TimeOfDay _endtime = TimeOfDay.now().replacing(hour: 11, minute: 30);

////////////////////////////calendar////////////////////////////////////////////////////
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  _onRangeSelected(DateTime? start, DateTime? end, DateTime focusDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusDay;
      _rangeStart = start;
      _rangeEnd = end;
    });
  }

/////////////////////////intialisation//////////////////////////////
  DateTime _selectedDate = DateTime.now();

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
  int _remindBefore = 5;
  String _progress = "To Do";
  String _member = "";
  String _owner = "option1";
  String dropdownValue = 'Option 1';
  List<String> repeatList = ["None", "Everyday", "Weekdays", "Weekend"];
  String _repeat = "None";
  int _number = 0;
  bool? isChecked1 = false;
  bool? isChecked2 = false;

  //////////////////////////////////list of corresponding Types//////////////////////////////////
  final List<Map<String, dynamic>> options = [
    {"text": "Meeting", "icon": Icons.calendar_month_rounded},
    {"text": "Visio ", "icon": Icons.camera_alt},
    {"text": "Call ", "icon": Icons.call},
    {"text": "SMS", "icon": Icons.sms},
    {"text": "Email", "icon": Icons.email},
    {"text": "Dossier", "icon": Icons.miscellaneous_services},
  ];
  //////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    String selectedItem = options[0]["text"].toString();

    return Scaffold(
      
      appBar: _appBar(context),
      body: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
              child: Column(children: [
/////////////////////////////tablecalendar///////////////////////////////////////
            TableCalendar(
              calendarFormat: _calendarFormat,
              startingDayOfWeek: StartingDayOfWeek.monday,
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
                CalendarFormat.week: 'Week',
              },
              rangeSelectionMode: RangeSelectionMode.toggledOn,
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2050, 1, 1),
              onPageChanged: (focusDay) {
                _focusedDay = focusDay;
              },
              calendarStyle: CalendarStyle(
                rangeStartDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 187, 249),
                  shape: BoxShape
                      .circle, // Changez cette couleur selon vos besoins
                ),
                rangeEndDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 187, 249),
                  shape: BoxShape
                      .circle, // Changez cette couleur selon vos besoins
                ),
                todayDecoration: BoxDecoration(
                  // Optional: Style for today's date
                  color: Color.fromARGB(255, 240, 187, 249),
                  shape: BoxShape.circle,
                ),
              ),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onRangeSelected: _onRangeSelected,
            ),
////////////////////////////////////////////////////////////////////////////////////
            SizedBox(
              height: 20,
            ),

///////////////////////////////Title///////////////////////////////////////////////////////
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(8),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.6)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: "Enter Your Activity Title",
                            icon: Image.asset(
                              'assets/name.png',
                              width: 40,
                              height: 40,
                            ),
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
                    ],
                  ),
                ),
              ],
            ),

/////////////////////////////////////////////////////////////////////////////////////////////////////////
            SizedBox(
              height: 20,
            ),

////////////////////////////////////////////////Owner///////////////////////////////////////////////////////////////
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Owner",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(8),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          Color.fromARGB(255, 238, 176, 249).withOpacity(0.6),
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
                            hintText: "$_owner",
                            suffixIcon: DropdownButton<String>(
                              underline: Container(),
                              icon: Row(
                                children: [
                                  Image.asset(
                                    'assets/owner.png', // Remplacez par le chemin réel vers votre image
                                    width:
                                        40, // Ajustez la largeur si nécessaire
                                    height:
                                        40, // Ajustez la hauteur si nécessaire
                                  ),
                                  SizedBox(
                                      width:
                                          2), // Espace entre l'image et l'icône
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 17,
                                    color: Color.fromARGB(255, 240, 187, 249),
                                  ),
                                ],
                              ),
                              elevation: 4,
                              onChanged: (String? newValue) {
                                setState(() {});
                              },
                              items: ownerList.map<DropdownMenuItem<String>>(
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
                    ],
                  ),
                ),
              ],
            ),

/////////////////////////////////////////////////////////////////////////////////
            SizedBox(height: 22),
//////////////////////////////////Activity Type/////////////////////////////////////
            Text(
              "Activity Types",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: options.map((option) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = option['text'];
                      });
                    },
                    child: Container(
                      width: 105,
                      height: 45,
                      decoration: BoxDecoration(
                        color: selectedItem == option['text']
                            ? Colors.purpleAccent
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            option['icon'] as IconData,
                            size: 20.0,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            option['text'],
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            SizedBox(
              height: 22,
            ),
///////////////////////////////////////////////////start and end time/////////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Pour espacer les éléments sur toute la largeur
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
                            color: Color.fromARGB(255, 238, 176, 249)
                                .withOpacity(0.6),
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
                                color: Color.fromARGB(255, 251, 160, 244)
                                    .withOpacity(0.9),
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
                            color: Color.fromARGB(255, 238, 176, 249)
                                .withOpacity(0.6),
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
                                color: Color.fromARGB(255, 251, 160, 244)
                                    .withOpacity(0.9),
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
////////////////////////////////////////////////////////////////////////////////////////
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
                      color:
                          Color.fromARGB(255, 238, 176, 249).withOpacity(0.6),
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
                                color: Color.fromARGB(255, 240, 187, 249),
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
                      color:
                          Color.fromARGB(255, 238, 176, 249).withOpacity(0.6),
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
                                color: Color.fromARGB(255, 240, 187, 249),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Corresponding Stage",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.start,
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(8),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          Color.fromARGB(255, 238, 176, 249).withOpacity(0.6),
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
                            hintText: "$_owner",
                            suffixIcon: DropdownButton<String>(
                              underline: Container(),
                              icon: Row(
                                children: [
                                  Image.asset(
                                    'assets/progress.png', // Remplacez par le chemin réel vers votre image
                                    width:
                                        40, // Ajustez la largeur si nécessaire
                                    height:
                                        40, // Ajustez la hauteur si nécessaire
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ), // Espace entre l'image et l'icône
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 17,
                                    color: Color.fromARGB(255, 240, 187, 249),
                                  ),
                                ],
                              ),
                              elevation: 4,
                              onChanged: (String? newValue) {
                                setState(() {});
                              },
                              items: progressList.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: progressColors[
                                                progressList.indexOf(value)],
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(value.toString()),
                                      ],
                                    ),
                                  );
                                },
                              ).toList(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 111, 111, 111),
                                fontSize: 13,
                              ),
                            ),
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
                    ],
                  ),
                ),
              ],
            ),

////////////////////////////////////////////////////////////////////////////////////////////////////////////
            SizedBox(height: 20),
//////////////////remind me and repeat ///////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Pour espacer les éléments sur toute la largeur
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remind",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.all(8),
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 238, 176, 249)
                                .withOpacity(0.6),
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
                                  hintText: "$_remindBefore min before",
                                  suffixIcon: DropdownButton<String>(
                                    underline: Container(),
                                    icon: Row(
                                      children: [
                                        Image.asset(
                                          'assets/rappel.png', // Remplacez par le chemin réel vers votre image
                                          width:
                                              35, // Ajustez la largeur si nécessaire
                                          height:
                                              35, // Ajustez la hauteur si nécessaire
                                        ),
                                        SizedBox(
                                            width:
                                                2), // Espace entre l'image et l'icône
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 17,
                                          color: Color.fromARGB(
                                              255, 240, 187, 249),
                                        ),
                                      ],
                                    ),
                                    elevation: 4,
                                    onChanged: (String? newValue) {
                                      setState(() {});
                                    },
                                    items: remindList
                                        .map<DropdownMenuItem<String>>(
                                            (int value) {
                                      return DropdownMenuItem<String>(
                                        value: value.toString(),
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 111, 111, 111),
                                      fontSize: 13,
                                    ),
                                  ),
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
                        "Repeat",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.all(8),
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 238, 176, 249)
                                .withOpacity(0.6),
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
                                  hintText: "$_repeat",
                                  suffixIcon: DropdownButton<String>(
                                    underline: Container(),
                                    icon: Row(
                                      children: [
                                        Image.asset(
                                          'assets/repeat.png', // Remplacez par le chemin réel vers votre image
                                          width:
                                              35, // Ajustez la largeur si nécessaire
                                          height:
                                              35, // Ajustez la hauteur si nécessaire
                                        ),
                                        SizedBox(
                                            width:
                                                2), // Espace entre l'image et l'icône
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 17,
                                          color: Color.fromARGB(
                                              255, 240, 187, 249),
                                        ),
                                      ],
                                    ),
                                    elevation: 4,
                                    onChanged: (String? newValue) {
                                      setState(() {});
                                    },
                                    items: repeatList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value.toString(),
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 111, 111, 111),
                                      fontSize: 13,
                                    ),
                                  ),
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
                          ],
                        ),
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
                  // Wrap each checkbox and text in a Row
                  children: [
                    Checkbox(
                      value: isChecked1,
                      activeColor: Color.fromARGB(255, 234, 161, 250),
                      onChanged: (newBool) =>
                          setState(() => isChecked1 = newBool),
                    ),
                    SizedBox(
                        width: 10.0), // Add spacing between checkbox and text
                    Text(
                      'Reminder before start date',
                    ),
                  ],
                ),
                Row(
                  // Repeat for the second checkbox and text
                  children: [
                    Checkbox(
                      value: isChecked2,
                      activeColor: Color.fromARGB(255, 234, 161, 250),
                      onChanged: (newBool) =>
                          setState(() => isChecked2 = newBool),
                    ),
                    SizedBox(width: 10.0), // Add spacing (optional)
                    Text(
                      'Reminder before due date',
                    ),
                  ],
                ),
              ],
            ),
/////////////////////////////////////////////////////////////////////////////////
            SizedBox(
              height: 25,
            ),
//////////////////////////////more details button////////////////////////////////////////////
            ElevatedButton(
              child: Text(
                'More Details',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 145, 33, 250),
                    fontWeight: FontWeight.w900),
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: AddDetailPage(),
                        ),
                      );
                    });
              },
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                backgroundColor: Color.fromARGB(255, 246, 228, 250),
              ),
            ),
            SizedBox(
              height: 10,
            ),
/////////////////////////////////Buttons///////////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Ajoutez vos autres widgets ici
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer
                  },
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.purple), // Couleur de fond du bouton
                  ),
                ),
              ],
            ),
          ]))),
////////////////////////////////////////////////////////////////////////////////////
    );
  }
//////////////////calendar////////////////////////////////////////

  _selectDate() async {
    DateTime? _pickeddate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: getInitialDate(),
        lastDate: DateTime.now().add(Duration(days: 30)));
    if (_pickeddate != null) {
      setState(() {
        //myEditTask?.setDate(_pickeddate.toString());
        //_selectedDate = _pickeddate;
      });
    }
  }

  DateTime getInitialDate() {
    DateTime now = DateTime.now().subtract(Duration(days: 0));
    if (_selectedDate.isBefore(now)) {
      return _selectedDate;
    } else
      return now;
  }

////////////////////////app bar//////////////////////////////////////////
  _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Create Activity",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context); // Pop the current route
        },
      ),
    );
  }
}

///////////////////////////calendar/////////////////////////////////////
TimeOfDay stringToTimeOfDay(String tod) {
  final format = DateFormat.jm(); //"6:00 AM"
  return TimeOfDay.fromDateTime(format.parse(tod));
}

extension DateTimeExt on DateTime {
  DateTime applyTimeOfDay({required int hour, required int minute}) {
    return DateTime(year, month, day, hour, minute, 0, 0, 0);
  }
}

extension TimeOfDayExtension on TimeOfDay {
  //To compare start & end time
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }

  //Add hour to current time for end time
  TimeOfDay add({int hour = 0, int minute = 0}) {
    return replacing(hour: hour + hour, minute: minute + minute);
  }
}
