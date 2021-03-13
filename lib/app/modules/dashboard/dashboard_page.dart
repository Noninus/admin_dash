import 'package:admin_dash/app/modules/dashboard/components/dashboard_card.dart';
import 'package:admin_dash/app/modules/dashboard/dashboard_controller.dart';
import 'package:admin_dash/app/modules/home/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/simple_area_chart.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key? key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  //use 'controller' variable to access controller

  _vendasCard() {
    return DashboardCard(
        color: Colors.red,
        icon: Icons.person,
        label: "Vendas",
        value: 'R\$ 1454,50');
  }

  _pessoasCard() {
    return DashboardCard(
        color: Colors.yellow, icon: Icons.person, label: "Pessoas", value: 121);
  }

  _qtdCard() {
    return DashboardCard(
        color: Colors.green, icon: Icons.person, label: "Qtd", value: 443);
  }

  _ticketMedioCard() {
    return DashboardCard(
        color: Colors.blue,
        icon: Icons.person,
        label: "Ticket Médio",
        value: 'R\$ 14,50');
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        body: ListView(
      children: [
        SelectableText(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            print(constraints.minWidth);
            if (constraints.minWidth > 750) {
              return Row(
                children: [
                  _vendasCard(),
                  _pessoasCard(),
                  _qtdCard(),
                  _ticketMedioCard()
                ],
              );
            } else {
              return Container(
                height: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _vendasCard(),
                    _pessoasCard(),
                    _qtdCard(),
                    _ticketMedioCard()
                  ],
                ),
              );
            }
          },
        ),
        SizedBox(height: 25),
        Container(height: 400, child: SimpleAreaChart())
      ],
    ));
  }
}
