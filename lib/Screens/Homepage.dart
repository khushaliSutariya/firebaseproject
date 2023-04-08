
import 'package:flutter/material.dart';

import 'AddEmployeeScreens.dart';
import 'AddproductScreens.dart';
import 'LoginScreens.dart';
import 'ViewEmployeeScreens.dart';
import 'ViewProductScreens.dart';
import 'ViewSortProduct.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase"),
      ),
      body: Column(
        children: [],
      ),
      drawer: Drawer(
        child: ListView(
          padding:  EdgeInsets.only(top: 35.0, left: 20.0),
          children: [
            ListTile(
              title:  Text('Add Product'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddproductScreens(),
                ));
              },
            ),
            ListTile(
              title:  Text('View Product'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ViewProductScreens(),
                ));
              },
            ),
            ListTile(
              title:  Text('Add Employee'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddEmployeeScreens(),
                ));
              },
            ),
            ListTile(
              title:  Text('View Employee'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ViewEmployeeScreens(),
                ));
              },
            ),
            ListTile(
              title:  Text('View Sort Product'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ViewSortProduct(),
                ));
              },
            ),
            ListTile(
              title:  Text('Login with google'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginScreens(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
