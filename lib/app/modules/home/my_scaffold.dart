import 'package:admin_dash/app/modules/home/components/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class MyScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  const MyScaffold({Key key, this.title = "Dashboard", this.body})
      : super(key: key);

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends ModularState<MyScaffold, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => controller.changeIsNavbar(),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () => Modular.to.pushReplacementNamed("/home/perfil"))
        ],
      ),
      body: Row(
        children: [
          Observer(builder: (_) {
            if (controller.isNavbar) {
              return Navbar();
            } else {
              return Container();
            }
          }),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: widget.body,
          )),
        ],
      ),
    );
  }
}
