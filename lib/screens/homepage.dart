import 'package:crud_api_operation/model/user_model.dart';
import 'package:crud_api_operation/services/add_data.dart';
import 'package:crud_api_operation/services/delete_user.dart';
import 'package:crud_api_operation/services/get_user.dart';
import 'package:crud_api_operation/services/update_user.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
                itemCount: snapshot.data.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data.data[index].name),
                    subtitle: Text("id : ${snapshot.data.data[index].id}"),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                deleteUser(id: snapshot.data.data[index].id);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                updateUserData(
                                    context: context,
                                    data: snapshot.data,
                                    index: index);
                              });
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            AddUserData(context: context);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
