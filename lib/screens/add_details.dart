import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddDetailPage extends StatefulWidget {
  AddDetailPage({Key? key}) : super(key: key);

  @override
  State<AddDetailPage> createState() => _AddDetailPageState();
}

class _AddDetailPageState extends State<AddDetailPage> {
////////////////////////////open files//////////////////////////////////////////////////////////
  void openFiles() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
    if (resultFile != null) {
      PlatformFile file = resultFile.files.first;
      print(file.name);
      print(file.bytes);
      print(file.extension);
      print(file.path);
    } else {}
  }

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
  int _selectedColor = 0;
  bool? isChecked1 = false;
  bool? isChecked2 = false;
////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
              child: Column(children: [
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
                            hintText: "$_priority",
                            suffixIcon: DropdownButton<String>(
                              underline: Container(),
                              icon: Row(
                                children: [
                                  Image.asset(
                                    'assets/prio.png', // Remplacez par le chemin réel vers votre image
                                    width:
                                        35, // Ajustez la largeur si nécessaire
                                    height:
                                        35, // Ajustez la hauteur si nécessaire
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
                              items: priorityList.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: priorityColors[
                                                priorityList.indexOf(value)],
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
                            hintText: "$_module",
                            suffixIcon: DropdownButton<String>(
                              underline: Container(),
                              icon: Row(
                                children: [
                                  Image.asset(
                                    'assets/modules.png', // Remplacez par le chemin réel vers votre image
                                    width:
                                        35, // Ajustez la largeur si nécessaire
                                    height:
                                        35, // Ajustez la hauteur si nécessaire
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
                              items: moduleList.map<DropdownMenuItem<String>>(
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

            SizedBox(
              height: 22,
            ),

            /////////////////////////////Color//////////////////////////////////////////
            _colorPalette(),
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
                      color: Colors.grey.withOpacity(0.6),
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

            Text(
              'The description is visible to all members',
              style: TextStyle(color: Colors.grey),
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
                      color: Colors.grey.withOpacity(0.6),
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
            Text(
              'Notes are private and visible only to internal members',
              style: TextStyle(color: Colors.grey),
            ),
////////////////////////////////////////////////////////////////////

            SizedBox(height: 20),

///////////////////////////upload file///////////////////////////////
            content(),
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
                  onChanged: (newBool) => setState(() => isChecked1 = newBool),
                ),
                Text(
                  'Send system message to selected colleagues ',
                ),
              ],
            ),

            Row(
              children: [
                Checkbox(
                  value: isChecked2,
                  activeColor: Color.fromARGB(255, 234, 161, 250),
                  onChanged: (newBool) => setState(() => isChecked2 = newBool),
                ),
                Text(
                  'send notification E-mails to selected  members',
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
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                  ),
                ),
              ],
            ),
///////////////////////////////////////////////////////////////////////////////////
          ]))),
    );
  }

////////////////////////app bar//////////////////////////////////////////
  _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context); // Pop the current route
        },
      ),
      title: Text(
        "Add Details",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

/////////////////////////////////////////////colors widget////////////////////////////////////////////////////
  _colorPalette() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Activity Color',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Wrap(
            children: List<Widget>.generate(
              5,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                  child: CircleAvatar(
                    backgroundColor: index == 0
                        ? Colors.purple
                        : index == 1
                            ? Colors.pink
                            : index == 2
                                ? Colors.lightBlue
                                : index == 3
                                    ? Colors.green
                                    : Colors.orange,
                    radius: 14,
                    child: _selectedColor == index
                        ? const Icon(
                            Icons.done,
                            size: 16,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

////////////////////////////upload your file widget/////////////////////////////////////////////////

  Widget content() {
    return GestureDetector(
      onTap: () {
        openFiles();
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 60,
        width: double.infinity,
        child: TextFormField(
          readOnly: true,
          onTap: openFiles,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'upload your file',
            hintStyle:
                TextStyle(color: const Color.fromARGB(255, 130, 129, 129)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: GestureDetector(
              onTap: openFiles,
              child: Icon(
                Icons.insert_drive_file,
                color: Color.fromARGB(255, 240, 187, 249),
              ),
            ),
          ),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
