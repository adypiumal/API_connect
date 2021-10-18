import 'dart:convert';

import 'package:newapi/class/get_class.dart';
import 'package:newapi/seervices/base_client.dart';
import 'base_controller.dart';

class TestController with Basecontroller {
//get data
  Future getData() async {
    showLoading("geting data");
    var response =
        await BaseClient().get('https://test.myconfero.com','users');

    var jsonData = jsonDecode(response.body);
    //           .catchError(handleError);
    // if (response == null) return;
    // hideLoading();
    // print(response);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["name"], u["email"], u["username"]);
      users.add(user);
    }
    print(users.length);
    return users;

    //     .catchError(handleError);
    // if (response == null) return;
    // hideLoading();
    // print(response);
  }

//post data
  void postData() async {
    showLoading("posting data");
    var request = {'message': 'post'};
    var response = await BaseClient()
        .post('https://jsonplaceholder.typicode.com', '/posts', request)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }

//delete data
  void deleteData() async {
    showLoading("deleting data");
    var requestDelete = {'message': 'delete'};
    var response = await BaseClient()
        .delete(
            'https://jsonplaceholder.typicode.com', '/posts/1', requestDelete)
        //,requestDelete )
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }

  //patch data
  void patchData() async {
    showLoading("patching data");
    var requestPatch = {'message': 'patch'};
    var response = await BaseClient()
        .patch('https://jsonplaceholder.typicode.com', '/posts/1', requestPatch)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }
}
