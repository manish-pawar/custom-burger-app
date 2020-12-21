import 'package:flutter/material.dart';
import 'package:flutter_app/models/burg.dart';


class BurgTile extends StatelessWidget {

  final Burg burg;
  BurgTile({ this.burg });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  'Your ${burg.name}',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
              )
            ),
            Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Having ${burg.bun} bun  and ${burg.patty} patty overloaded with ${burg.cheese} cheese for daily lunch',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                )
            ),
            Container(
                padding: EdgeInsets.all(40.0),
                margin: EdgeInsets.only(left : 20.0, top: 20.0, right: 20.0 , bottom: 0.0),
                decoration: BoxDecoration(
                    color: (burg.bun == 'normal') ? Colors.amber: Colors.amber[900],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90.0),
                      topRight: Radius.circular(90.0),
                    ),
                ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: (burg.cheese == 'normal') ? Colors.amber[500]: ((burg.cheese == 'Italian') ? Colors.amber[700]: Colors.amber[900]),

              ),
            ),
            Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Enjoy Lunch',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                )
            ),
            Container(
              padding: EdgeInsets.all(35.0),
              margin: EdgeInsets.only(left : 10.0, top: 5.0, right: 10.0 , bottom: 0.0),
              decoration: BoxDecoration(
                color: (burg.patty == 'normal') ? Colors.brown[500]: ((burg.patty == 'Salty') ? Colors.brown[400]: ((burg.patty == 'Spicy') ? Colors.red[900] :Colors.brown[900])),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90.0),
                  topRight: Radius.circular(90.0),
                  bottomRight: Radius.circular(90.0),
                  bottomLeft: Radius.circular(90.0),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(3.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.red[burg.sauce],
              ),
            ),
            Container(
              padding: EdgeInsets.all(40.0),
              margin: EdgeInsets.only(left : 20.0, top: 0.0, right: 20.0 , bottom: 0.0),
              decoration: BoxDecoration(
                color: (burg.bun == 'normal') ? Colors.amber: Colors.amber[900],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90.0),
                  bottomRight: Radius.circular(90.0),
                ),
              ),
            ),
          ],
        )
          // title: Text( '${burg.name}'),
          // subtitle:
      ),
    );
  }
}
