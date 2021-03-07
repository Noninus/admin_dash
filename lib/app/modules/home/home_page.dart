import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  final Widget body;
  const HomePage({Key key, this.title = "Dashboard", this.body})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
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
              onPressed: () => print('open profile page'))
        ],
      ),
      body: Row(
        children: [
          Observer(builder: (_) {
            if (controller.isNavbar) {
              return Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border(
                        right: BorderSide(color: Colors.grey, width: 1.0)),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.dashboard),
                        title: Text("Dashboard"),
                        onTap: () => Modular.to.pushReplacementNamed('/home'),
                      ),
                      ListTile(
                        leading: Icon(Icons.bar_chart),
                        title: Text("Relátorios"),
                        onTap: () => Modular.to.pushReplacementNamed(
                          '/home/relatorios',
                        ),
                      )
                    ],
                  ));
            } else {
              return Container();
            }
          }),
          Expanded(child: widget.body),
        ],
      ),
    );
  }
}
