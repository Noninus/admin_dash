import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () => print('open profile page'))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [Text('ss')],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 250,
                  child: Card(color: Colors.red, child: Text('a')),
                )),
                Expanded(
                    child: Container(
                  height: 250,
                  child: Card(color: Colors.yellow, child: Text('a')),
                )),
                Expanded(
                    child: Container(
                  height: 250,
                  child: Card(color: Colors.green, child: Text('a')),
                )),
                Expanded(
                    child: Container(
                  height: 250,
                  child: Card(color: Colors.blue, child: Text('a')),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
