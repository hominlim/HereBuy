import 'package:flutter/material.dart';

class MyInformation extends StatefulWidget {
  MyInformation({Key? key}) : super(key: key);

  @override
  State<MyInformation> createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: Text(
        "My Information",
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }

  Widget _bodyWidget() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
