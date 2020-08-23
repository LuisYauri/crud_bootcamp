import 'package:crud_bootcamp/services/api_service.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  var textNameController = TextEditingController();
  var textJobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: textNameController,
                decoration: InputDecoration(labelText: 'Name'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: textJobController,
                decoration: InputDecoration(labelText: 'Job'),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.deepPurple,
                child: Text(
                  'Crear',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  var data = {
                    'name': textNameController.text,
                    'job': textJobController.text,
                  };
                  ApiService().createUser(data).then((value) {
                    print(value);
                    Navigator.of(context).pop();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
