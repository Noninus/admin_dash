import 'package:admin_dash/app/modules/home/my_scaffold.dart';
import 'package:admin_dash/app/modules/perfil/perfil_controller.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key? key, this.title = "Perfil"}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends ModularState<PerfilPage, PerfilController> {
  //use 'controller' variable to access controller

  void _showSucessFlushbar(BuildContext context) {
    Flushbar(
      backgroundColor: Colors.green,
      message: 'Ação realizada com sucesso!',
      duration: Duration(seconds: 3),
      title: "Sucesso",
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(12),
    ).show(context);
  }

  void _showSimpleFlushbar(BuildContext context, String title, String message) {
    Flushbar(
      message: '$message',
      duration: Duration(seconds: 3),
      title: "$title",
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(12),
    ).show(context);
  }

  void _showErrorFlushbar(BuildContext context) {
    Flushbar(
      backgroundColor: Colors.red,
      message: 'Falha ao realizar uma ação!',
      duration: Duration(seconds: 3),
      title: "Erro",
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(12),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MyScaffold(
        body: Column(
      children: [
        Container(
          height: 300,
          child: Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
              Positioned(
                  bottom: 0,
                  left: width * 0.05,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(
                                'http://lavinephotography.com.au/wp-content/uploads/2017/01/PROFILE-Photography-112.jpg')),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  )),
              Positioned(
                  bottom: 20,
                  left: width * 0.05 + 175,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rafael Nonino Filho",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Flutter 💙\nDesenvolvedor",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  )),
              Positioned(
                  bottom: 25,
                  right: width * 0.05,
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.white,
                      onPressed: () =>
                          _showSimpleFlushbar(context, "TODO", "Editar Perfil"),
                    ),
                  )),
            ],
          ),
        ),
        Text("Teste de Snackbars:"),
        SizedBox(height: 10),
        ElevatedButton(
            onPressed: () => _showSucessFlushbar(context),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            child: Text("Sucesso!")),
        SizedBox(height: 10),
        ElevatedButton(
            onPressed: () => _showErrorFlushbar(context),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            child: Text("Erro"))
      ],
    ));
  }
}
