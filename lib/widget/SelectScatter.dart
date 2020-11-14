import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectScatter extends StatefulWidget {
  @override
  createState() => SelectScatterState();
}

class SelectScatterState extends State<SelectScatter> {
  int _selected = 11;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(
          value: 12,
          title: Text("Подробный"),
          groupValue: _selected,
          activeColor: Colors.red,
          onChanged: _onSelect,
        ),
        RadioListTile(
          value: 11,
          title: Text("Средний"),
          groupValue: _selected,
          activeColor: Colors.yellow,
          onChanged: _onSelect,
        ),
        RadioListTile(
          value: 10,
          title: Text("Общий"),
          groupValue: _selected,
          activeColor: Colors.green,
          onChanged: _onSelect,
        ),
      ],
    );
  }

  _onSelect(int val) {
    setState(() {
      _selected = val;
    });
  }
}
