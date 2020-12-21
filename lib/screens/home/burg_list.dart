import 'package:flutter/material.dart';
import 'package:flutter_app/models/burg.dart';
import 'package:flutter_app/screens/home/burg_tile.dart';
import 'package:flutter_app/shared/loading.dart';
import 'package:provider/provider.dart';


class BurgList extends StatefulWidget {
  @override
  _BurgListState createState() => _BurgListState();
}

class _BurgListState extends State<BurgList> {
  @override
  Widget build(BuildContext context) {

    final burgs = Provider.of<Burg>(context);

    if( burgs != null) {
      return BurgTile(burg: burgs);
    }
    else{
      return Loading();
    }


  }
}
