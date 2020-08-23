import 'package:crud_bootcamp/services/api_service.dart';
import 'package:flutter/material.dart';

class ListUsersPage extends StatefulWidget {
  @override
  _ListUsersPageState createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  List listUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiService().getListUsers().then((value) {
      setState(() {
        listUsers = value['data'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              itemsButtonsComponent(),
              listUserComponent(),
//              listUserComponent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemsButtonsComponent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          color: Colors.deepPurple,
          child: Text(
            'Get List Users',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            ApiService().getListUsers().then((value) {
              setState(() {
                listUsers = value['data'];
              });
            });
          },
        ),
        SizedBox(
          width: 10,
        ),
        FlatButton(
          color: Colors.deepPurple,
          child: Text(
            'Crear Usuario',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/create-user');
          },
        )
      ],
    );
  }

  Widget listUserComponent() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                for (var item in listUsers)
                  Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(item['avatar']),
                              radius: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(item['first_name']),
                                Text(item['email']),
                                FlatButton(
                                  child: Text('Actualizar'),
                                  onPressed: () {
                                    var user = {
                                      'id': item['id'],
                                      'firstName': item['first_name'],
                                      'lastName': item['last_name'],
                                    };
                                    Navigator.of(context).pushNamed(
                                        '/update-user',
                                        arguments: user);
                                  },
                                ),
                                FlatButton(
                                  child: Text('Eliminar'),
                                  onPressed: () {
                                    ApiService()
                                        .deleteUser(item['id'])
                                        .then((value) => print(value));
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
