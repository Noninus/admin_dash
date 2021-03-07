import 'package:admin_dash/app/modules/home/my_scaffold.dart';
import 'package:admin_dash/app/modules/relatorios/relatorios_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RelatoriosPage extends StatefulWidget {
  final String title;
  const RelatoriosPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _RelatoriosPageState createState() => _RelatoriosPageState();
}

class _RelatoriosPageState
    extends ModularState<RelatoriosPage, RelatoriosController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        body: Column(
      children: [
        Observer(builder: (_) {
          return Text('${controller.value}');
        }),
        ElevatedButton(
            onPressed: () => controller.increment(), child: Text("increment"))
      ],
    ));
  }
}
