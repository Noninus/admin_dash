import 'package:admin_dash/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Navbar extends StatefulWidget {
  final HomeController controller;

  const Navbar({Key? key, required this.controller}) : super(key: key);
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
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
                widget.controller.changeIsNavbar();
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text("Relátorios"),
              onTap: () {
                const relatoriosPath = "/home/relatorios";
                Modular.to.pushReplacementNamed(relatoriosPath);
                widget.controller.changeIsNavbar();
              },
            )
          ],
        ));
  }
}
