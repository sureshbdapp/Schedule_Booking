import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class MyAlertDialog extends StatefulWidget {
//
//   @override
//   Widget build(BuildContext context,String msg) {
//     return ElevatedButton(
//       onPressed: () => _showAlertDialog(context,msg),
//       child: Text('Show Alert Dialog'),
//     );
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//
//   }
// }

void myAlertDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Enter OTP", textAlign: TextAlign.center),
        content: Text(msg,
            style: TextStyle(
                fontSize: 20,
                color: Colors.redAccent,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              // Perform your action here if needed
            },
          ),
        ],
      );
    },
  );
}

mySnackBar(BuildContext context, String msg) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
  ));
}

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16);
}
