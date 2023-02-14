import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

//
// Widget ShowSnackBar(BuildContext context, String text) {
//   return ScaffoldMessenger(
//     // <<<< <<<< hello Mr. ScaffoldMessenger
//     child: Text(text),
//   );
// }
// void showSnackBar(BuildContext context, String text) {
//   showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
//           child: Text(text),
//         );
//       });
// }
void showSnackBar(BuildContext context, String text) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text(text),
            );
          },
        );
      });
}
// void showSnackBar(BuildContext context, String text) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(text),
//       duration: Duration(milliseconds: 200),
//     ),
//   );
// }

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path as String));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
