import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'InfoView.dart';
import 'TestView.dart';
import 'View.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    locale: Locale('ru', 'RU'),
    supportedLocales: const <Locale>[Locale('ru', 'RU')],
    theme: ThemeData.light().copyWith(primaryColor: Color(0xFF007ec5)),
    initialRoute: '/',
    routes: _initRoutes(),
  ));
}

/// Инициализация роутов.
Map<String, WidgetBuilder> _initRoutes() {
  return {
    '/': (BuildContext context) => View('Главная', () {
          return InfoView();
        }),
    '/test': (BuildContext context) => View('Тест', () {
      return TestView();
    }),
  };
}

/// Общее меню.
class CommonMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      semanticLabel: 'label',
      child: new ListView(
        children: [
          DrawerHeader(child: new Text('Spb-Alert')),
          _createMenuItem(context, 'Главная', '/', icon: Icons.home),
        ],
      ),
    );
  }

  /// Создает элемент меню.
  Widget _createMenuItem(BuildContext context, String caption, String route,
      {IconData icon = Icons.keyboard_arrow_right_sharp}) {
    return ListTile(
      title: Text(caption),
      leading: Icon(icon),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
