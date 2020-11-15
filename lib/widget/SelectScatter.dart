import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectScatter extends StatefulWidget {
  SelectScatterState state;

  int getSelected() {
    return state._selected;
  }

  @override
  State<StatefulWidget> createState() {
    state = new SelectScatterState();
    return state;
  }
}

class SelectScatterState extends State<SelectScatter> {
  int _selected = 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: new Text(
            'Точность локации',
            style:
            DefaultTextStyle
                .of(context)
                .style
                .apply(fontSizeFactor: 1.3, color: Theme.of(context).primaryColor),
          ),
          padding: EdgeInsets.only(top: 10),
        ),
        RadioListTile(
          value: 10,
          title: Text("Подробный"),
          groupValue: _selected,
          activeColor: Colors.red,
          onChanged: _onSelect,
        ),
        RadioListTile(
          value: 7,
          title: Text("+-200 м"),
          groupValue: _selected,
          activeColor: Colors.yellow,
          onChanged: _onSelect,
        ),
        RadioListTile(
          value: 6,
          title: Text("+- 600 м"),
          groupValue: _selected,
          activeColor: Colors.green,
          onChanged: _onSelect,
        ),
        RadioListTile(
          value: 4,
          title: Text("+-20 км"),
          groupValue: _selected,
          activeColor: Colors.blue,
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
