import 'package:alert/GroupInfo.dart';
import 'package:flutter/material.dart';

class ViewListResult extends StatelessWidget {
  List<GroupInfo> items;

  ViewListResult(this.items);

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Text('Пусто');
    }
    return ListView.builder(
      itemBuilder: (context, index) => _makeItem(context, items[index]),
      itemCount: items.length,
    );
  }

  Widget _makeItem(BuildContext context, GroupInfo groupInfo) {
    return ListTile(
      title: Text(groupInfo.types.join(", ")),
      subtitle: Text(groupInfo.geoHash),
    );
  }
}
