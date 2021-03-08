import 'package:admin_dash/app/modules/dashboard/components/dashboard_card.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        Container(
          child: Row(
            children: [
              DashboardCard(
                  color: Colors.red,
                  icon: Icons.person,
                  label: "Vendas",
                  value: 'R\$ 1454,50'),
              DashboardCard(
                  color: Colors.yellow,
                  icon: Icons.person,
                  label: "Pessoas",
                  value: 121),
              DashboardCard(
                  color: Colors.green,
                  icon: Icons.person,
                  label: "Qtd",
                  value: 443),
              DashboardCard(
                  color: Colors.blue,
                  icon: Icons.person,
                  label: "Ticket Médio",
                  value: 'R\$ 14,50'),
            ],
          ),
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    ));
  }
}
