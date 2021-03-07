import 'package:admin_dash/app/modules/dashboard/dashboard_controller.dart';
import 'package:admin_dash/app/modules/home/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        body: Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  color: Colors.green,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: Container(),
        )
      ],
    ));
  }
}
