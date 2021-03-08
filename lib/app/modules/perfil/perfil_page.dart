import 'package:admin_dash/app/modules/home/my_scaffold.dart';
import 'package:admin_dash/app/modules/perfil/perfil_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends ModularState<PerfilPage, PerfilController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        body: Column(
      children: [
        Container(
          height: 275,
          child: Stack(
            children: [
              Container(
                color: Colors.orange,
                height: 200,
              ),
              Positioned(
                  bottom: 0,
                  left: 100,
                  child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.wikihow.com/images_en/thumb/a/a4/Be-a-Sweetheart-Step-1.jpg/v4-460px-Be-a-Sweetheart-Step-1.jpg.webp')),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Icon(Icons.person)))
            ],
          ),
        ),
      ],
    ));
  }
}
