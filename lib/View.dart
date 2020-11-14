import 'package:flutter/material.dart';

import 'main.dart';

typedef Supplier<Widget> = Widget Function();

class View extends StatelessWidget {
  final String _title;
  final Supplier<Widget> supplier;

  View(this._title, this.supplier);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._title),
      ),
//      drawer: CommonMenu(),
      body: Container(
        child: supplier(),
      ),
    );
  }
}
