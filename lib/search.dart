// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_import, implementation_imports, unused_import, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'main.dart';
import 'searchservice.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  late QuerySnapshot snapshotData;
  late bool isExcecuted = false;

  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
          itemCount: snapshotData.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
         // หน้าที่จะเชื่อมไปยังเอกสารที่ต้องการจะโชว์
              // onTap: () {
              //   Get.to(main(),
              //       transition: Transition.downToUp,
              //       arguments: snapshotData.docs[index]);
              // },
              child: ListTile(
                title: Text(
                  snapshotData.docs[index]['Type'],
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
            );
          });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.close),
          onPressed: () {
            setState(() {
              isExcecuted = false;
            });
          }),
      backgroundColor: Colors.indigo[400],
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val) {
              return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    val.queryData(searchController.text).then((value) {
                      snapshotData = value;
                      setState(() {
                        isExcecuted = true;
                      });
                    });
                  });
            },
          )
        ],
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Search', hintStyle: TextStyle(color: Colors.white)),
          controller: searchController,
        ),
        backgroundColor: Colors.indigo,
      ),
      body: isExcecuted
          ? searchedData()
          : Container(
              child: Center(
                child: Text(
                  'search',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
            ),
      // body: isExcecuted ? snapshotData() : Container(),
    );
  }
}
