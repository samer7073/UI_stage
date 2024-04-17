///////////////////////////////////// Activity Details Page //////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/Entity/colorPalette.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/activity_page/Details_page/uploadFile.dart';

class AddDetailPage extends StatefulWidget {
  AddDetailPage({Key? key}) : super(key: key);
  @override
  State<AddDetailPage> createState() => _AddDetailPageState();
}

class _AddDetailPageState extends State<AddDetailPage> {
/////////////////////////intialisation//////////////////////////////
  List<String> priorityList = ["Low", "Medium", "High", "Urgent"];
  List<Color> priorityColors = [
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red
  ];
  List<String> moduleList = [
    "Booking",
    "Contact",
    "Deal",
    " Helpdesk",
    "Leads",
    "Organisation",
    "Product",
    "Project",
    "User"
  ];
  String _priority = "High";
  String dropdownValue = 'Leads';
  String _module = "Leads";
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  String? selecteddepartment;
////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),

              /////////////////////////////////priority////////////////////////////////////////////////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Priority",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField<String>(
                    value: _priority,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    items: priorityList
                        .map<DropdownMenuItem<String>>(
                            (String depar) => DropdownMenuItem<String>(
                                  value: depar,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: priorityColors[
                                              priorityList.indexOf(depar)],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(depar.toString()),
                                    ],
                                  ),
                                ))
                        .toList(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 111, 111, 111),
                        fontSize: 14),
                    onChanged: (String? newValue) {
                      setState(() {
                        _priority = newValue!;
                      });
                    },
                  ),
                ],
              ),

              ///////////////////////////////////////////////////////////////////////////////////////
              SizedBox(height: 20),
              ///////////////////////////////Select Module///////////////////////////////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Module",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField<String>(
                    value: _module,
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        'assets/modules.png',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    items: moduleList
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
                        _module = newValue!;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(
                height: 22,
              ),

              /////////////////////////////Activity Color//////////////////////////////////////////
              Center(child: colorPalette()),
              ////////////////////////////////////////////////////////////////////////////////

              SizedBox(
                height: 20,
              ),

              /////////////////////////////////////////Description//////////////////////////////////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 135, 135, 135)
                            .withOpacity(0.6),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Add Description",
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

              SizedBox(
                height: 15,
              ),

              Center(
                child: Text(
                  'The description is visible to all members',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              /////////////////////////////////////////////////////////////////////////////////////////

              SizedBox(height: 20),

              ////////////////////////////////Note/////////////////////////////////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Note",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 135, 135, 135)
                            .withOpacity(0.6),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Add Note",
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

              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  'Notes are private and visible only to internal members',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              ////////////////////////////////////////////////////////////////////

              SizedBox(height: 20),

              ///////////////////////////upload file///////////////////////////////
              uploadFile(),
              //////////////////////////////////////////////////////////////////////

              SizedBox(
                height: 10,
              ),

              ////////////////check boxes/////////////////////////////
              Row(
                children: [
                  Checkbox(
                    value: isChecked1,
                    activeColor: Color.fromARGB(255, 234, 161, 250),
                    onChanged: (newBool) =>
                        setState(() => isChecked1 = newBool),
                  ),
                  Text(
                    'Send system message to selected colleagues ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
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
                    activeColor: Color.fromARGB(255, 234, 161, 250),
                    onChanged: (newBool) =>
                        setState(() => isChecked2 = newBool),
                  ),
                  Text(
                    'send notification E-mails to selected external members',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              ////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 35,
              ),

              /////////////////////////////////Button ///////////////////////////////////////////
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
              ///////////////////////////////////////////////////////////////////////////////////
            ]),
          ))),
    );
  }
}
