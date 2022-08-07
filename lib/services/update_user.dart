import 'package:crud_api_operation/model/user_model.dart';
import 'package:crud_api_operation/screens/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

updateUser({required Data model, required id}) async {
  Uri url = Uri.parse("https://maaz-api.tga-edu.com/api/users/$id");
  await http.put(url,
      headers: {'Content-Type': 'application/json'},
      body: convert.jsonEncode(model.toJson()));
}

// //////////////////////////////////
updateUserData({required BuildContext context, data, index}) {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  Alert(
      context: context,
      title: "UPDATE API",
      content: Column(
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.account_circle),
              labelText: 'Username',
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            updateUser(
                model: Data(
                    name: nameController.text,
                    email: data.data[index].email,
                    username: usernameController.text),
                id: data.data[index].id);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Homepage();
            }));
          },
          child: Text(
            "Update".toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}
