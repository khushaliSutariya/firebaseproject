import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseproject/Screens/UpdateProductScreens.dart';
import 'package:flutter/material.dart';

class ViewProductScreens extends StatefulWidget {
  const ViewProductScreens({Key? key}) : super(key: key);

  @override
  State<ViewProductScreens> createState() => _ViewProductScreensState();
}

class _ViewProductScreensState extends State<ViewProductScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View products"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Products").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.size <= 0) {
              return Center(
                child: Text("No Data"),
              );
            } else {
              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return ListTile(
                    leading: Image.network(document["fileurl"].toString()),
                    title: Text(document["name"].toString()),
                    subtitle: Text(document["price"].toString()),
                    trailing: ElevatedButton(
                      child: Text("Update"),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UpdateProductScreens(
                            updateid: document.id.toString(),
                          ),
                        ));
                      },
                    ),
                    onTap: () async {
                      var id = document.id.toString();

                      await FirebaseStorage.instance
                          .ref(document["filename"].toString())
                          .delete()
                          .then((value) async {
                        await FirebaseFirestore.instance
                            .collection("Products")
                            .doc(id)
                            .delete()
                            .then((value) {
                          print("Deleted");
                        });
                      });
                    },
                  );
                }).toList(),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
