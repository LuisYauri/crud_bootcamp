import 'package:crud_bootcamp/pages/create_user.dart';
import 'package:flutter/material.dart';

import 'pages/list_users_page.dart';
import 'pages/update_user.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: ListUsersPage(),
      routes: {
        '/create-user': (BuildContext context) => CreateUser(),
        '/update-user': (BuildContext context) => UpdateUser(),
      },
    ));
