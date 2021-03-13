import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  final _formKey = GlobalKey<FormState>();

  _leftScreen(bool isCellphone) {
    if (isCellphone) return Container();
    return Expanded(
      flex: 2,
      child: Container(
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 350,
              ),
            ],
          )),
    );
  }

  _rightScreen() {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ))),
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                    ),
                    onFieldSubmitted: (_) => _entrar(),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Senha',
                    ),
                    onFieldSubmitted: (_) => _entrar(),
                  ),
                  ElevatedButton(
                      onPressed: () => _entrar(), child: Text("Entrar"))
                ],
              ),
            ),
          ),
          Expanded(flex: 2, child: Center(child: Text('Esqueceu sua senha?'))),
        ],
      ),
    ));
  }

  _entrar() {
    Modular.to.pushReplacementNamed('home/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: <Widget>[
          _leftScreen(width < 750 ? true : false),
          _rightScreen(),
        ],
      ),
    );
  }
}
