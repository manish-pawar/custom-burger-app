import 'package:flutter/material.dart';
import 'package:flutter_app/models/burg.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/database.dart';
import 'package:flutter_app/shared/constants.dart';
import 'package:flutter_app/shared/loading.dart';
import 'package:provider/provider.dart';


class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> buns = ['normal', 'Roasted'];

  final List<String> cheeses = ['normal', 'Italian', 'Japanese' ];

  final List<String> pattys = ['normal', 'Spicy', 'Salty', 'Medium'];

  String _currentName;
  String _currentBun;
  String _currentCheese;
  String _currentPatty;
  int _currentSauce;

  @override
  Widget build(BuildContext context) {
    final burgs = Provider.of<Burg>(context);
    final user = Provider.of<User>(context);
    if( burgs != null){
      return Form(
        key : _formKey,
        child: Column(
          children: <Widget>[
            Text(
              'Update your Burger lunch settings.',
              style: TextStyle( fontSize: 18.0),
            ),

            SizedBox(height: 10.0),
            DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _currentBun ?? burgs.bun,
              items: buns.map((bun) {
                return DropdownMenuItem(
                  value: bun,
                  child: Text('$bun bun'),
                );
              }).toList(),
              onChanged: (val) => setState(() => _currentBun = val),
            ),
            DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _currentCheese ?? burgs.cheese,
              items: cheeses.map((cheese) {
                return DropdownMenuItem(
                  value: cheese,
                  child: Text('$cheese cheese'),
                );
              }).toList(),
              onChanged: (val) => setState(() => _currentCheese = val),
            ),
            DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _currentPatty ?? burgs.patty,
              items: pattys.map((patty) {
                return DropdownMenuItem(
                  value: patty,
                  child: Text('$patty patty'),
                );
              }).toList(),
              onChanged: (val) => setState(() => _currentPatty = val),
            ),
            Slider(
              value: (_currentSauce ?? burgs.sauce ).toDouble(),
              inactiveColor: Colors.red[_currentSauce ?? 100 ],
              activeColor: Colors.red[_currentSauce ?? 100 ],
              min: 100.0,
              max: 900.0,
              divisions: 8,
              onChanged: (val) => setState(() => _currentSauce = val.round()),
            ),
            RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Update',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()){
                  await DatabaseService(uid: user.uid).updateUserData(
                      _currentBun ?? burgs.bun,
                      _currentSauce ?? burgs.sauce,
                      _currentCheese ?? burgs.cheese,
                      _currentPatty ?? burgs.patty,
                      _currentName ?? 'burger choice'
                  );
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      );
    }
    else{
      return Loading();
    }




  }
}

