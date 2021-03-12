import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'loading_controller.dart';

class LoadingPage extends StatefulWidget {
  final String title;
  const LoadingPage({Key? key, this.title = "Loading"}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends ModularState<LoadingPage, LoadingController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      print(Modular.to.path);
      if (Modular.to.path != '/login') {
        print('pushed');
        Modular.to.pushReplacementNamed('/login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          ),
          // ElevatedButton(
          //     onPressed: () => Modular.to.pushNamedAndRemoveUntil(
          //           '/login',
          //           ModalRoute.withName('/login'),
          //         ),
          //     child: Text('aaa'))
        ],
      ),
    );
  }
}
