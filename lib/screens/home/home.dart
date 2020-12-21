import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/burg.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/home/burg_list.dart';
import 'package:flutter_app/screens/home/settings_form.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/services/database.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return StreamProvider<Burg>.value(
                value: DatabaseService(uid: user.uid).burgs,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                  child: SettingsForm(),
                ),
            );
        });
    }

    return StreamProvider<Burg>.value(
      value: DatabaseService(uid: user.uid).burgs,
      child: Scaffold(
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
          title: Text('OBurg'),
          backgroundColor: Colors.red,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(
                    Icons.person,
                    color: Colors.white,
                ),
                label: Text(
                    'Logout',
                    style : TextStyle(
                      color: Colors.white,
                    )
                ),
                onPressed: () async{
                    await _auth.signOut();
                },
            ),
            FlatButton.icon(
              icon: Icon(
                  Icons.settings,
                  color: Colors.white,
              ),
              label: Text(
                  'settings',
                  style : TextStyle(
                    color: Colors.white,
                  )
              ),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: BurgList(),
      ),
    );
  }
}
