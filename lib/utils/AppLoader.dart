import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import 'package:flutter/material.dart';

// class LoadingDialog {
//   static OverlayEntry? _overlayEntry;
//   static bool isLoading=false;
//
//   static void show(BuildContext context) {
//     _overlayEntry = OverlayEntry(
//       opaque: false,
//       maintainState: false,
//       builder: (context) => WillPopScope(
//         onWillPop: () => Future.sync(onWillPop),
//         child: Stack(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 // Do nothing on tap
//               },
//               child: Container(
//                 color: Colors.transparent,
//               ),
//             ),
//             BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//               child: Center(
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color:HexColor(appThemeColor),
//                       borderRadius: BorderRadius.circular(12)
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: CircularProgressIndicator(
//                       color:HexColor(colorWhite),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//
//         ),
//       ),
//     );
//
//     Overlay.of(context).insert(_overlayEntry!);
//     isLoading=true;
//   }
//
//   static void hide(BuildContext context) {
//     if (_overlayEntry != null) {
//       _overlayEntry!.remove();
//       isLoading=false;
//       _overlayEntry = null;
//     }
//   }
//   static bool onWillPop() {
//     return false;
//   }
// }

class AppLoader extends StatelessWidget {
  static bool isLoading = false;

  static void show(BuildContext context, {Key? key}) {
    isLoading = true;
    showDialog<void>(
      context: context,
      useRootNavigator: false,
      barrierColor: Colors.black26,
      barrierDismissible: false,
      builder: (_) => AppLoader(key: key),
    ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));
  }

  static void hide(BuildContext context) {
    try {
      isLoading = false;
      Navigator.of(context).pop(true);
    } catch (error) {
      print(error.toString());
    }
  }

  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didpop) {},
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 22, horizontal: 22),
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
