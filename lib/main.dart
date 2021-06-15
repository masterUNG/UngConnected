import 'package:flutter/material.dart';
import 'package:ungconnected/states/authen.dart';
import 'package:ungconnected/states/create_account.dart';
import 'package:ungconnected/states/my_service.dart';
import 'package:ungconnected/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/myService': (BuildContext context) => MyService(),
};

String? firstState;

void main() {
  firstState = MyConstant.routeAuthen;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      routes: map,
      initialRoute: firstState,
    );
  }
}
