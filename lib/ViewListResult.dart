import 'package:alert/GroupInfo.dart';
import 'package:flutter/material.dart';

class ViewListResult extends StatelessWidget {
  List<GroupInfo> items;

  ViewListResult(this.items);

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
          child: Text(
        "Нет данных",
        textAlign: TextAlign.center,
      ));
    }
    return ListView.builder(
      itemBuilder: (context, index) => _makeItem(context, items[index]),
      itemCount: items.length,
    );
  }

  Widget _makeItem(BuildContext context, GroupInfo groupInfo) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _chooseColor(groupInfo),
      ),
      title: _makeTitle(groupInfo),
      subtitle: _makeSubscript(groupInfo),
    );
  }

  MaterialColor _chooseColor(GroupInfo info) {
    if (info.actual > 80) {
      return Colors.red;
    } else if (info.actual > 47) {
      return Colors.yellow;
    }
    return Colors.green;
  }

  Widget _makeTitle(GroupInfo info) {
    return Container(
      child: Row(
        children: [
          Text('Ситуация: ${info.types.join(", ")}'),
          Expanded(child: Text('  Количество обращений: ${info.countAlert}')),
          Text('${info.actual} %'),
        ],
      ),
    );
  }

  Widget _makeSubscript(GroupInfo info) {
    return Container(
      child: Row(
        children: [
          Flexible(child: Text('Районы города: ${info.district}')),
        ],
      ),
    );
  }
}
