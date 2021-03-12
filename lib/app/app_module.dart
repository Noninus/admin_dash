import 'package:admin_dash/app/modules/loading/loading_module.dart';
import 'package:admin_dash/app/modules/login/login_module.dart';
import 'package:flutter/scheduler.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:admin_dash/app/app_widget.dart';
import 'package:admin_dash/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/login',
            module: LoginModule(),
            guards: [UserLoggedInGuard(userIsLoggedIn: false)]),
        ModularRouter(Modular.initialRoute, module: LoadingModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

class UserLoggedInGuard implements RouteGuard {
  final bool userIsLoggedIn;

  const UserLoggedInGuard({required this.userIsLoggedIn});

  @override
  bool canActivate(String url) {
    // This is suppose to be where is do your "is logged in check"
    // however, as noted in the Modular projects issue tracker,
    // this will throw an exception when false. Instead we "jimmy rig"
    // this so that it is always true because the onGuarded is always called (?)
    // before route change (when used as a route guard). Both are needed however.
    return true;
  }

  @override
  List<GuardExecutor> get executors =>
      [LoginExecutor(userIsLoggedIn: userIsLoggedIn)];
}

class LoginExecutor extends GuardExecutor {
  final bool userIsLoggedIn;

  LoginExecutor({required this.userIsLoggedIn});

  @override
  onGuarded(String path, {required bool isActive}) {
    if (userIsLoggedIn) {
      return;
    }

    if (path != Modular.initialRoute && path != '/login') {
      SchedulerBinding.instance!.addPostFrameCallback((_) {
        Modular.to.pushReplacementNamed(Modular.initialRoute);
      });
    }
  }
}
