import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
class UpdateProductScreens extends StatefulWidget {


  var updateid="";
  UpdateProductScreens({required this.updateid});

  @override
  State<UpdateProductScreens> createState() => _UpdateProductScreensState();
}

class _UpdateProductScreensState extends State<UpdateProductScreens> {
  TextEditingController _productcode = TextEditingController();
  TextEditingController _productname = TextEditingController();
  TextEditingController _productprice = TextEditingController();
  ImagePicker _picker = ImagePicker();
  var group = "simple";
  var selected = "Mobilels & Electonic Devices";

  bool isloading=false;


  File? selectedfile;

  var oldname="";
  var oldurl="";
  getdata() async
  {
    await FirebaseFirestore.instance.collection("Products").doc(widget.updateid).get().then((document) async{
      _productcode.text = document["productcode"].toString();
      _productname.text = document["name"].toString();
      _productprice.text = document["price"].toString();
      setState(() {
        group = document["type"].toString();
        selected=  document["category"].toString();
        oldurl =  document["fileurl"].toString();
        oldname =  document["filename"].toString();
      });
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update products"),
      ),
      body: (isloading)?Center(
        child: CircularProgressIndicator(),
      ):SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: (selectedfile!=null)?Image.file(selectedfile!,width: 200.0,)
                    :(oldurl!="")?Image.network(oldurl):Container()

              ),
              ElevatedButton(
                  onPressed: () async{
                    XFile? image = await _picker.pickImage(source: ImageSource.camera);
                    setState(() {
                      selectedfile = File(image!.path);
                    });
                  },
                  child: Text("Camera")),
              ElevatedButton(
                  onPressed: () async{
                    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      selectedfile = File(image!.path);
                    });
                  },
                  child: Text("Gallary")),
              Text(
                "Product Code",
                style: TextStyle(fontSize: 20.0),
              ),
              TextField(
                controller: _productcode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Product Name",
                style: TextStyle(fontSize: 20.0),
              ),
              TextField(
                controller: _productname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Product Price",
                style: TextStyle(fontSize: 20.0),
              ),
              TextField(
                controller: _productprice,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Simple",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Radio(
                    value: "simple",
                    groupValue: group,
                    onChanged: (value) {
                      setState(() {
                        group = value!;
                      });
                    },
                  ),
                  Text(
                    "Variable",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Radio(
                    value: "variable",
                    groupValue: group,
                    onChanged: (value) {
                      setState(() {
                        group = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Category: ",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  DropdownButton(
                    value: selected,
                    items: [
                      DropdownMenuItem(
                        child: Text("Mobilels & Electonic Devices"),
                        value: "Mobilels & Electonic Devices",
                      ),
                      DropdownMenuItem(
                        child: Text("Fashion & Beauty"),
                        value: "Fashion & Beauty",
                      ),
                      DropdownMenuItem(
                        child: Text("Home,Furniture & Application"),
                        value: "Home,Furniture & Application",
                      ),
                      DropdownMenuItem(
                        child: Text("Music,Video and Gaming"),
                        value: "Music,Video and Gaming",
                      ),
                      DropdownMenuItem(
                        child: Text("Books & Education"),
                        value: "Books & Education",
                      ),
                      DropdownMenuItem(
                        child: Text("Office & Professional"),
                        value: "Office & Professional",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selected = value!;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isloading=true;
                        });
                        var code = _productcode.text.toString();
                        var name = _productname.text.toString();
                        var price = _productprice.text.toString();
                        var type = group;
                        var category = selected;

                        //upload

                        // for check camera or gallery image selected or not
                        if(selectedfile==null)
                          {
                            await FirebaseFirestore.instance.collection("Products").doc(widget.updateid).update({
                              "productcode": code,
                              "name": name,
                              "price": price,
                              "type": type,
                              "category": category,
                            }).then((value){
                              setState(() {
                                isloading=false;
                              });
                              Navigator.of(context).pop();
                            });
                          }
                        else
                          {
                            //Image Delete -- done
                            //Image upload-- done
                            //Data update
                            var uuid = Uuid();
                            var filename = uuid.v1();
                            await FirebaseStorage.instance.ref(oldname).delete().then((value) async{
                              await FirebaseStorage.instance.ref(filename).putFile(selectedfile!).whenComplete((){}).then((filedata) async{
                                await filedata.ref.getDownloadURL().then((fileurl) async{
                                  await FirebaseFirestore.instance.collection("Products").doc(widget.updateid).update({
                                    "productcode": code,
                                    "name": name,
                                    "price": price,
                                    "type": type,
                                    "category": category,
                                    "filename":filename,
                                    "fileurl":fileurl
                                  }).then((value){
                                    setState(() {
                                      isloading=false;
                                    });
                                    Navigator.of(context).pop();
                                  });
                                });
                              });
                            });

                          }
                        //upload


                      },
                      child: Text("Update")),
                  SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Cancel"))
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
}
