import 'package:crud_bootcamp/services/api_service.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget {
  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  var textNameController = TextEditingController();
  var textJobController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('Esta componente se destruido');
  }

  @override
  Widget build(BuildContext context) {
    final Map user = ModalRoute.of(context).settings.arguments as Map;
    textNameController.text = user['firstName'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Update User: ${user['firstName']}-${user['lastName']}'),
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
                  'Actualizar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  var data = {
                    'name': textNameController.text,
                    'job': textJobController.text,
                  };
                  ApiService().updateUser(user['id'], data).then((value) {
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
