import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/test_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _postContainer() {
    return Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(1, 1, 100, 4),
        ),
        child: TextButton(
            onPressed: () async {
              controller.postData();
            },
            child: Text(
              'Post data',
              style: TextStyle(color: Colors.white),
            )));
  }

  Widget _getContainer() {
    return Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(1, 100, 10, 4),
        ),
        child: TextButton(
            onPressed: () async {
              controller.getData();
              
            },
            child: Text(
              'get data',
              style: TextStyle(color: Colors.white),
            )));
  }

  Widget _deleteContainer() {
    return Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(200, 1, 10, 4),
        ),
        child: TextButton(
            onPressed: () async {
              controller.deleteData();
            },
            child: Text(
              'delete data',
              style: TextStyle(color: Colors.white),
            )));
  }

  Widget _patchContainer() {
    return Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(50, 50, 1, 4),
        ),
        child: TextButton(
            onPressed: () async {
              controller.patchData();
            },
            child: Text(
              'patch data',
              style: TextStyle(color: Colors.white),
            )));
  }

  final controller = TestController();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(200, 1, 10, 4),
              title: Text(
                'Flutter API',
              ),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  _getContainer(),
                  SizedBox(
                    height: 10,
                  ),
                  _postContainer(),
                  SizedBox(
                    height: 10,
                  ),
                  _deleteContainer(),
                  SizedBox(
                    height: 10,
                  ),
                  _patchContainer()
                ]))));
  }
}
