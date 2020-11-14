import 'package:flutter/material.dart';

class SelectRetro extends StatefulWidget {
  SelectRetroState state;

  int getSelected() {
    return state._selected;
  }

  @override
  State<StatefulWidget> createState() {
    state = new SelectRetroState();
    return state;
  }
}

class SelectRetroState extends State<SelectRetro> {
  int _selected = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text('Диапазон анализа'),
          padding: EdgeInsets.only(top: 10),
        ),
        RadioListTile(
          value: 1,
          title: Text("1 час"),
          groupValue: _selected,
          activeColor: Colors.red,
          onChanged: _onSelect,
        ),
        RadioListTile(
          value: 3,
          title: Text("3 часа"),
          groupValue: _selected,
          activeColor: Colors.yellow,
          onChanged: _onSelect,
        ),
        RadioListTile(
          value: 12,
          title: Text("12 часов"),
          groupValue: _selected,
          activeColor: Colors.green,
          onChanged: _onSelect,
        ),
        RadioListTile(
          value: 24,
          title: Text("24 часа"),
          groupValue: _selected,
          activeColor: Colors.blue,
          onChanged: _onSelect,
        )
      ],
    );
  }

  _onSelect(int val) {
    setState(() {
      _selected = val;
    });
  }
}
