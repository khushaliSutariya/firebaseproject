import 'package:flutter/material.dart';
class ViewEmployeeScreens extends StatefulWidget {
  const ViewEmployeeScreens({Key? key}) : super(key: key);

  @override
  State<ViewEmployeeScreens> createState() => _ViewEmployeeScreensState();
}

class _ViewEmployeeScreensState extends State<ViewEmployeeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Employee"),
      ),
    );
  }
}
