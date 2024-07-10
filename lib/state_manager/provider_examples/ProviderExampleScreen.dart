import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProviderNotifier.dart';

class ProviderExampleScreen extends StatefulWidget {
  const ProviderExampleScreen({super.key});

  @override
  State<ProviderExampleScreen> createState() => _ProviderExampleScreenState();
}

class _ProviderExampleScreenState extends State<ProviderExampleScreen> {
  // var progress = 1.0;
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<ProviderNotifier>(context, listen: false);
    print("hello");
    return Center(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ProviderNotifier>(builder: (context, val, child) {
            return Slider(
                value: val.progressValue,
                max: 1,
                min: 0,
                onChanged: (value) {
                  val.setProgressValue(value);
                  print(value);
                  // setState(() {});
                });
          }),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Consumer<ProviderNotifier>(builder: (context, val, child) {
              return Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 100,
                    color: Colors.blue.withOpacity(val.progressValue),
                  )),
                  Expanded(
                      child: Container(
                    height: 100,
                    color: Colors.orange.withOpacity(val.progressValue),
                  ))
                ],
              );
            }),
          )
        ],
      ),
    ));
  }
}
