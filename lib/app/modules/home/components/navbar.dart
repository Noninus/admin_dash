import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border(right: BorderSide(color: Colors.grey, width: 1.0)),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              onTap: () {
                const dashboardPath = "/home/dashboard";
                Modular.to.pushReplacementNamed(dashboardPath);
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text("Relátorios"),
              onTap: () {
                const relatoriosPath = "/home/relatorios";
                Modular.to.pushReplacementNamed(relatoriosPath);
              },
            )
          ],
        ));
  }
}
