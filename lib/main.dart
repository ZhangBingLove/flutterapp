import 'package:flutter/material.dart';
import 'package:flutterapp/router/router_local.dart';
import 'package:flutterapp/view/home/home_pager.dart';

/**
 * runApp启动程序
 *
 * MaterialApp
 *
 */
void main() => runApp(new AppWidget());

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: new HomePager(),

      /// 设置全局的路由
      onGenerateRoute: LocalRouter.generateRoute,
    );
  }
}
