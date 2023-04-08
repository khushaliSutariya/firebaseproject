
import 'package:flutter/material.dart';
class ViewSortProduct extends StatefulWidget {
  const ViewSortProduct({Key? key}) : super(key: key);

  @override
  State<ViewSortProduct> createState() => _ViewSortProductState();
}

class _ViewSortProductState extends State<ViewSortProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Sort Product"),
      ),
    );
  }
}
