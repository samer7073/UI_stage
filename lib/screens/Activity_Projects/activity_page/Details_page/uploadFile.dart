
////////////////////////////////////////// Upload File ////////////////////////////////////////////////

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class uploadFile extends StatefulWidget {
  const uploadFile({super.key});

  @override
  State<uploadFile> createState() => _uploadFileState();
}

class _uploadFileState extends State<uploadFile> {
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

  @override
  Widget build(BuildContext context) {
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
